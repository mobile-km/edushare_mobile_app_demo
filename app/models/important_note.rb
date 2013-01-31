# -*- coding: utf-8 -*-
class ImportantNote < DemoModel
  attr_accessor :title, :desc, :number, :time

  def self.make_all
    8.times.map do |num|
      self.new :title => "重要词条 #{num}", 
               :desc => "重要词条 #{num} 的要素详情",
               :number => "#{num*2 + 1}",
               :time => "#{num * 2}:#{num * 7}"
    end
  end

end
