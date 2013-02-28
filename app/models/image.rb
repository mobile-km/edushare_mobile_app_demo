class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  field :alt, :type => String, :default => ''

  belongs_to :p_text_cell
  has_mongoid_attached_file :image

  def url
    self.image.url
  end

end
