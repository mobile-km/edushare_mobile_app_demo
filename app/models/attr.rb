class Attr
  include Mongoid::Document

  field :key,   :type => String
  field :value, :type => String

  belongs_to :text_cell,
             :foreign_key => :text_cell_id,
             :class_name  => 'PTextCell'

  def to_hash
    hash = serializable_hash
    hash.delete "_id"
    hash.delete "text_cell_id"
    hash.symbolize_keys
  end
end