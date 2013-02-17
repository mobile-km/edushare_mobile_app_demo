class Feature < DemoModel
  attr_accessor :title, :problem, :solution

  def self.make_all
    LoadData::FEATURES
  end
end