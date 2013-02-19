class Reference < DemoModel
  attr_accessor :title, :url, :desc

  def self.make_all
    LoadData::REFERENCES
  end
end