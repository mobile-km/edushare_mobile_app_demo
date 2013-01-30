class CourseTimeExpression < DemoModel
  attr_accessor :course, :user, :sn_id

  def self.find_by_sn_id(sn_id)
    ALL[sn_id][0]
  rescue
    nil
  end

  def self.make_all
    courses = Course.all
    c_1 = courses[0] # Java程序设计
    c_2 = courses[1] # Java EE & Android
    c_3 = courses[2] # Javascript & jQuery
    c_4 = courses[3] # 数据结构
    c_5 = courses[4] # 代码重构
    c_6 = courses[5] # 计算机操作系统

    users = User.all
    user_1 = users[0] # 诸葛亮
    user_2 = users[1] # 庞统

    [
      # 星期一
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "1-1"),
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "1-2"),
      CourseTimeExpression.new(:course => c_5, :user => user_2, :sn_id => "1-5"),
      CourseTimeExpression.new(:course => c_5, :user => user_2, :sn_id => "1-6"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "1-7"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "1-8"),
      # 星期二
      CourseTimeExpression.new(:course => c_2, :user => user_1, :sn_id => "2-3"),
      CourseTimeExpression.new(:course => c_2, :user => user_1, :sn_id => "2-4"),
      CourseTimeExpression.new(:course => c_3, :user => user_1, :sn_id => "2-7"),
      CourseTimeExpression.new(:course => c_3, :user => user_1, :sn_id => "2-8"),
      CourseTimeExpression.new(:course => c_4, :user => user_2, :sn_id => "2-9"),
      CourseTimeExpression.new(:course => c_4, :user => user_2, :sn_id => "2-10"),
      # 星期三
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "3-3"),
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "3-4"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "3-11"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "3-12"),
      # 星期四
      CourseTimeExpression.new(:course => c_3, :user => user_1, :sn_id => "4-1"),
      CourseTimeExpression.new(:course => c_3, :user => user_1, :sn_id => "4-2"),
      CourseTimeExpression.new(:course => c_2, :user => user_1, :sn_id => "4-7"),
      CourseTimeExpression.new(:course => c_2, :user => user_1, :sn_id => "4-8"),
      CourseTimeExpression.new(:course => c_4, :user => user_2, :sn_id => "4-9"),
      CourseTimeExpression.new(:course => c_4, :user => user_2, :sn_id => "4-10"),
      # 星期五
      CourseTimeExpression.new(:course => c_5, :user => user_2, :sn_id => "5-1"),
      CourseTimeExpression.new(:course => c_5, :user => user_2, :sn_id => "5-2"),
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "5-5"),
      CourseTimeExpression.new(:course => c_1, :user => user_1, :sn_id => "5-6"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "5-7"),
      CourseTimeExpression.new(:course => c_6, :user => user_2, :sn_id => "5-8"),
    ]
  end
  ALL = make_all.group_by{|i|i.sn_id}
end