# -*- coding: utf-8 -*-
class Courseware < DemoModel
  attr_accessor :title, :attach

  def self.make_all
    cw1 = self.new :title => 'jQuery Ajax请求', :attach => '/jquery_ajax.ppt'
    cw2 = self.new :title => 'jQuery 动画效果', :attach => '/jquery_animate.ppt'
    cw3 = self.new :title => 'jQuery 选择器', :attach => '/jquery_ajax.ppt'
    cw4 = self.new :title => 'jQuery 事件机制', :attach => '/jquery_events.ppt'
    cw5 = self.new :title => 'jQuery DOM操作', :attach => '/jquery_dom.ppt'
    cw6 = self.new :title => 'jQuery 遍历和筛选', :attach => '/jquery_traverse.ppt'
    cw7 = self.new :title => 'jQuery 杂项工具', :attach => '/jquery_utilities.ppt'
    cw8 = self.new :title => 'jQuery 集合操作', :attach => '/jquery_collection.ppt'

    [cw1, cw2, cw3, cw4, cw5, cw6, cw7, cw8]
  end
end
