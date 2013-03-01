class Attr
  include Mongoid::Document

  field :key,   :type => String
  field :value, :type => String

  belongs_to :text_cell,
             :foreign_key => :text_cell_id,
             :class_name  => 'PTextCell'

  def to_hash
    {self.key.to_sym => self.value}
  end
end