# -*- coding: utf-8 -*-
class Notice < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    8.times.map do |num|
      self.new :title => "张飞评论了你的列表#{num * 2 + 1}次", :desc => "软件重构需要#{num}曾嵌套  重构（Refactoring）就是在不改变软件现有功能的基础上，通过调整程序代码改善软件的质量、性能，使其程序的设计模式和架构更趋合理，提高软件的扩展性和维护性。"
    end
  end
end
