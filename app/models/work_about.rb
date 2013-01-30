# -*- coding: utf-8 -*-
class WorkAbout < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    8.times.map do |num|
      self.new :title => "法国大革命的第#{num}个比要素", :desc => "法国大革命的第#{num}个比要素详情"
    end
  end

end
