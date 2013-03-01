# -*- coding: utf-8 -*-
class PTextCell
  include Mongoid::Document
  include Mongoid::Paperclip

  field :title,   :type => String
  field :desc,    :type => String, :default => ''
  # 内部存储格式，调用请用format
  field :rformat, :type => String, :default => ''




  belongs_to :parent,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell'

  has_many   :children,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell',
             :order => [[:_id, :asc]]

  has_many   :images

  has_many   :rattrs,
             :foreign_key => :text_cell_id,
             :class_name  => 'Attr',
             :order => [[:_id, :asc]]

  has_mongoid_attached_file :cover

  scope :roots, where(:parent_id => nil).order_by([[:_id, :asc]])


  def order
    return self.get_sibling_order if parent.blank?
    "#{traverse_order}_#{self.get_sibling_order}"
  end

  def get_sibling_order
    self.siblings_and_self.index(self) + 1
  end

  def url
    self.order
  end

  def level
    ancestors.count + 1
  end

  # list [{:a=>1},{:b=>2}]
  def update_attrs(list)
    self.rattrs.destroy_all
    list.map(&:symbolize_keys).each do |attr_hash|
      arr = attr_hash.to_a.flatten
      key = arr[0].to_sym
      value = arr[1]
      self.rattrs.create(key => value)
    end
  end

  def attrs
    self.reload
    self.rattrs.map(&:to_hash)
  end

  def format=(string)
    self.rformat = string
  end

  def format
    Format.new(self.rformat || "")
  end

  def ancestors 
    traverse_ancestors self
  end

  def is_ancestor_of?(cell)
    cell.ancestors.include? self
  end

  def siblings_and_self
    return self.class.roots.to_a if self.parent.blank?
    self.parent.children.to_a
  end

  def siblings
    siblings_and_self.dup.to_a.reject {|cell| cell == self}
  end

  def prev_sibling
    get_relative_sibling(:-)
  end

  def next_sibling
    get_relative_sibling(:+)
  end

  def prev
    cell = prev_sibling
    return self.parent if cell.blank?
    return cell if cell.children.blank?

    cell = cell.children.last
    while !cell.children.blank?
      cell = cell.children.last
    end

    return cell
  end

  def next
    return self.children.first if !self.children.blank?

    cell = self
    result = cell.next_sibling
    while result.blank?
      cell = cell.parent
      return nil if cell.blank?
      result = cell.next_sibling
    end

    result
  end

  def is_in_same_sub_tree?(another_text_cell, start_level=2)
    return true if self == another_text_cell

    text_cell_1 = self.get_ancestor_of_level(start_level)
    text_cell_2 = another_text_cell.get_ancestor_of_level(start_level)
    text_cell_1 == text_cell_2 && !!text_cell_2 
  end

  # 获取自身和自身的祖先节点中，level等于传入level的节点
  # 如果传入level大于当前节点level，则返回nil
  # 如果传入level等于当前节点level，则返回当前节点自身
  # 如果传入level小于当前节点level，则返回祖先节点对应level的节点
  # 其他异常情况，返回nil
  def get_ancestor_of_level(level)
    return nil if self.level < level.to_i
    return self if self.level == level.to_i

    self.ancestors.each do |text_cell|
      return text_cell if text_cell.level == level.to_i
    end
    
    nil
  end

  def is_match_level?(*args)
    levels = args.map{|arg|arg.to_i}.sort
    return levels[0] == self.level if levels.count == 1

    from_level = levels[0]
    to_level = levels[1]

    from_level.to_i <= self.level && to_level.to_i >= self.level
  end

  # 判断 text_cell 的祖先中是否有指定 attr 值等于指定value的节点
  def is_match_ancestors_attr?(attr_name, attr_value)
    self.ancestors.each do |text_cell|
      return true if text_cell.is_match_attr?(attr_name, attr_value)
    end
    false
  end

  # 判断 text_cell 的指定 attr 的值是否等于指定的 value
  def is_match_attr?(attr_name, attr_value)
    attrs[attr_name.to_sym] == attr_value
  end

  def ==(cell)
    self.id == cell.id
  end

  def method_missing(method, *attrs)
    case method.to_s
    when /attr_(.*)/
      self.attrs[$1.to_sym]
    else
      return super
    end
  end

  def self.by_id(order)
    self.by_order(order)
  end

  def self.by_url(url)
    self.by_order(url)
  end

  def self.by_order(order)
    pieces = order.split("_").map(&:to_i)
    pieces[0...(pieces.length - 1)].inject(self.roots) do |siblings, sibling_order|
      siblings[sibling_order - 1].children
    end[pieces.last-1]
  end

  def to_hash
    hash = {}
    hash["title"]  = self.title   if !self.title.blank?
    hash["desc"]   = self.desc    if !self.desc.blank?
    hash["cover"]  = self.cover   if !self.cover.blank?
    hash["format"] = self.rformat if !self.rformat.blank?

    if !self.attrs.blank?
      hash["attrs"]  = self.attrs.map do |key,value|
        {key.to_s=>value}
      end
    end

    if !self.images.blank?
      hash["images"] = self.images.map{|image|image.to_hash}
    end

    if !self.children.blank?
      hash["children"] = self.children.map{|text_cell|text_cell.to_hash}
    end

    hash
  end

private

  def get_relative_sibling(opt)
    index = self.siblings_and_self.index(self).send opt, 1
    return nil if index < 0 || index > self.siblings_and_self.count
    self.siblings_and_self[index]
  end

  def traverse_order
    self.ancestors.map(&:get_sibling_order).join('_')
  end

  def traverse_ancestors(cell, acc=[])
    return acc if cell.parent.blank?
    traverse_ancestors cell.parent, [cell.parent] + acc
  end

end
