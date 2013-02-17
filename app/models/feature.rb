class Feature < DemoModel
  attr_accessor :title, :desc, :purpose

  def self.make_all
    LoadData::FEATURES
  end
end