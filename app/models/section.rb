# coding: utf-8
class Section < DemoModel
  attr_accessor :title

  def self.make_all
    b1_1 = self.new
    b1_1.title = '第一章 Ajax'

    b1_2 = self.new
    b1_2.title = '第二章 Attributes'

    b1_3 = self.new
    b1_3.title = '第三章 Callbacks Object'


    b1_4 = self.new
    b1_4.title = '第四章 Core'


    b1_5 = self.new
    b1_5.title = '第四章 CSS'


    [b1_1, b1_2, b1_3, b1_4, b1_5]
  end
  
end