# -*- coding: no-conversion -*-
class PTextCell
  include Mongoid::Document

  field :title,   :type => String
  field :desc,    :type => String, :default => ''
  # 内部存储格式，调用请用attrs
  field :rattrs,  :type => Array,  :default => []
  # 内部存储格式，调用请用format
  field :rformat, :type => String, :default => ''
  field :cover,   :type => String

  belongs_to :parent,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell'

  has_many   :children,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell'

  has_many   :images

  scope :roots, where(:parent_id => nil)

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
    ancestors.count
  end

  def attrs=(list)
    self.rattrs = list.to_a.map(&:symbolize_keys).map(&:to_a)
  end

  def attrs
    ActiveSupport::OrderedHash[*self.rattrs.flatten]
  end

  def format=(string)
    self.rformat = formats_str.split(";").inject({}) do |hash, str|
      arr = str.split(":")
      hash[arr[0].to_sym] = arr[1]
      hash
    end
  end

  def format
    TextCellParser::Format.new(self.rformat)
  end

  def cover
    self.cover || images.first.url || ''
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

  def ==(cell)
    self.id == cell.id
  end

  def method_missing(method, *attrs)
    case method.to_s
    when /attr_(.*)/
      self.attrs[$1[1].to_sym]
    when /format_(.*)/
      self.format[$1[1].to_sym]
    else
      return super
    end
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

private

  def get_relative_sibling(opt)
    index = self.siblings_and_self.index(self).send opt, 1
    return nil if index < 0 || index > self.siblings_and_self.count
    self.siblings_and_self[index]
  end

  def get_absolute_prev_sibling(cell, context=nil)
    return cell.parent if cell.prev_sibling.blank?
    return cell.prev_sibling if cell.prev_sibling.children.blank?
    get_absolute_prev_sibling(cell.prev_sibling.children.last)
  end

  def get_absolute_next_sibling(cell, context=nil)
    return cell.children.first if !cell.children.blank?
    get_absolute_next_sibling(cell.next_sibling.children.first)
  end

  def traverse_order
    self.ancestors.map(&:get_sibling_order).join('_')
  end

  def traverse_ancestors(cell, acc=[])
    return acc if cell.parent.blank?
    traverse_ancestors cell.parent, [cell.parent] + acc
  end

end
