class PTextCell
  include Mongoid::Document

  field :title,  :type => String
  field :desc,   :type => String
  field :rattrs, :type => Array
  field :images, :type => Array
  field :format, :type => String
  field :cover,  :type => String

  belongs_to :parent,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell'

  has_many   :children,
             :foreign_key => :parent_id,
             :class_name  => 'PTextCell'

  scope :roots, where(:parent_id => nil)

  def attrs=(list)
    self.rattrs = list.to_a.map(&:to_a)
  end

  def attrs
    ActiveSupport::OrderedHash[*self.rattrs.flatten]
  end

  def images
    self.images.flatten.map {|data| TextCellParser::Image.new(data)}
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
    return self.class.roots if self.parent.nil?
    self.parent.children
  end

  def siblings
    arr = siblings_and_self.dup.to_a
    arr.delete self
    arr
  end

  def prev_sibling
    get_relative_sibling(:+)
  end

  def prev_sibling
    get_relative_sibling(:-)
  end

private

  def get_relative_sibling(opt)
    index = self.siblings_and_self.index(self) 
    self.siblings_and_self[index..index.send(opt, 1)].first
  end

  def traverse_ancestors(cell, acc=[])
    return acc if cell.parent.nil?
    traverse_ancestors cell.parent, [cell.parent] + acc
  end

end
