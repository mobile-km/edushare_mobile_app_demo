# -*- coding: utf-8 -*-
class Notice < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    8.times.map do |num|
      self.new :title => "张飞评论了你的列表#{num}次", :desc => "软件重构需要#{num}曾嵌套"
    end
  end
end
