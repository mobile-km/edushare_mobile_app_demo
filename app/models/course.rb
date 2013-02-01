class Course < DemoModel
  attr_accessor :title, :desc, :location

  def self.make_all
    LoadData::COURSES
  end
end