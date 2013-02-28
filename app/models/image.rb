class Image
  include Mongoid::Document
  field :alt,   :type => String, :default => ''

  belongs_to :p_text_cell
  has_mongoid_attached_file :image

end
