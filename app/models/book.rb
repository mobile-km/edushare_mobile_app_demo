# coding: utf-8
class Book < DemoModel
  attr_accessor :title, :cover_img, :sections

  def add_section(section)
    self.sections ||= []
    self.sections << section
    section.book = self
  end

  def self.make_all
    a1_1 = self.new
    a1_1.title = 'Jquery API'
    a1_1.cover_img = '/assets/ruby.jpg'

    a1_2 = self.new
    a1_2.title = 'Ruby 重构'
    a1_2.cover_img = '/assets/ruby.jpg'

    a1_3 = self.new
    a1_3.title = 'Java 重构'
    a1_3.cover_img = '/assets/ruby.jpg'


    a1_4 = self.new
    a1_4.title = 'Thinking in Java'
    a1_4.cover_img = '/assets/ruby.jpg'


    a1_5 = self.new
    a1_5.title = 'Head first Java'
    a1_5.cover_img = '/assets/ruby.jpg'


    [a1_1, a1_2, a1_3, a1_4, a1_5]
  end
  
end