class Course < DemoModel
  attr_accessor :title, :desc, :location

  def self.make_all
    c_1 = Course.new(:title => "Java程序设计", :desc => "课程描述占位", :location => '一营操练场' )
    c_2 = Course.new(:title => "Java EE & Android", :desc => "课程描述占位", :location => '二营操练场' )
    c_3 = Course.new(:title => "Javascript & jQuery", :desc => "课程描述占位", :location => '三营操练场' )
    c_4 = Course.new(:title => "数据结构", :desc => "课程描述占位", :location => '四营操练场' )
    c_5 = Course.new(:title => "代码重构", :desc => "课程描述占位", :location => '五营操练场' )
    c_6 = Course.new(:title => "计算机操作系统", :desc => "课程描述占位", :location => '六营操练场' )
    [c_1,c_2,c_3,c_4,c_5,c_6]
  end
end