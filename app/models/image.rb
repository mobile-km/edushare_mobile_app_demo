class Image
  include Mongoid::Document
  field :image, :type => String, :default => ''
  field :alt,   :type => String, :default => ''

  belongs_to :p_text_cell

  def url
    self.image
  end
end
