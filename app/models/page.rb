class Page < DemoModel
  attr_accessor :image_url, :desc, :url, :prev, :next

  def self.image_url(image,kind)
    "/html_demo_png/#{kind}_scenes/#{image}"
  end

  def _set_next(page)
    return if page.blank?
    self.next = page
    page.prev = self
  end

  def self.by_url(url)
    LoadData::PAGES_HASH[url]
  end
end