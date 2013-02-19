class Scene < DemoModel
  attr_accessor :title, :desc, :url, :pages

  def self.make_all
    LoadData::SCENES
  end

  def self.mobile_scenes
    LoadData::MOBILE_SCENES
  end

  def self.web_scenes
    LoadData::WEB_SCENES
  end

  def _build_pages(pages_arr,kind)
    self.pages = []
    pages_arr.each_with_index do |hash,index|
      image_url = Page.image_url(hash["image"],kind)
      desc = hash["desc"]
      url = File.join(self.url,"#{index+1}")
      self.pages << Page.new(:image_url => image_url, :desc => desc, :url => url)
    end
    self.pages.each_with_index do |page,index|
      page._set_next(self.pages[index+1])
    end
  end
end
