# -*- coding: utf-8 -*-
class ImportantNote < DemoModel
  attr_accessor :desc, :time, :entry
  delegate :title, :to => :entry
  delegate :number, :to => :entry
 
  def self.make_all
    8.times.map do |num|
      id = num + 1

      self.new :desc => "重要词条 #{id} 的要素详情",
               :entry => Entry.find(id),
               :time => 3.days.ago - num.hours +  num.minute
    end
  end
end
