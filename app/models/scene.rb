class Scene < DemoModel
  attr_accessor :title, :url, :pages

  def self.make_all
    LoadData::SCENES
  end

  def _build_pages(pages_arr)
    self.pages = []
    pages_arr.each_with_index do |hash,index|
      image_url = Page.image_url(hash["image"])
      desc = hash["desc"]
      url = File.join(self.url,"#{index+1}")
      self.pages << Page.new(:image_url => image_url, :desc => desc, :url => url)
    end
    self.pages.each_with_index do |page,index|
      page._set_next(self.pages[index+1])
    end
  end
end
