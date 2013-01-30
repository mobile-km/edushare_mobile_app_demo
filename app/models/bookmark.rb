# coding: utf-8
class Bookmark
  attr_accessor :title, :desc

  def self.all
    @all ||= self.make_all
  end

  def self.make_all
    d1_1 = self.new
    d1_1.title = '软件重构'
    d1_1.desc = '为了更容易维护代码'

    d1_2 = self.new
    d1_2.title = 'jQuery教程'
    d1_2.desc = '学习前端不可少的一门课'

    d1_3 = self.new
    d1_3.title = 'android 开发'
    d1_3.desc = '为了社会android的普及'

    d1_4 = self.new
    d1_4.title = 'ios 开发'
    d1_4.desc = '规范的一门开发'

    d1_5 = self.new
    d1_5.title = 'java 教程'
    d1_5.desc = '开发人员必备的书'

    [d1_1, d1_2, d1_3, d1_4, d1_5]
  end
  
end