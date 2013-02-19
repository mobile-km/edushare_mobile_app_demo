class SummaryItem < DemoModel
  attr_accessor :title, :desc, :image

  def self.make_all
    LoadData::SUMMARY_ITEMS
  end

  def self.direction_items
    LoadData::SUMMARY_DIRECTION_ITEMS
  end

  def self.strategy_items
    LoadData::SUMMARY_STRATEGY_ITEMS
  end

  def self.product_items
    LoadData::SUMMARY_PRODUCT_ITEMS
  end

  def image_url
    "/html_demo_png/summary/#{image}"
  end

end