# -*- coding: utf-8 -*-
class Courseware < DemoModel
  attr_accessor :title, :attach, :desc

  def self.make_all
    cw1 = self.new(:title  => 'jQuery Ajax请求',
                   :desc   => 'jQuery Ajax请求的过程和方式，以及内部的机制。',
                   :attach => '/jquery_ajax.ppt')

    cw2 = self.new(:title  => 'jQuery 动画效果',
                   :desc   => 'jQuery 动画效果的常用API',
                   :attach => '/jquery_animate.ppt')

    cw3 = self.new(:title  => 'jQuery 选择器',
                   :desc   => 'jQuery 常用选择器，一些常见的错误用法及更正。',
                   :attach => '/jquery_ajax.ppt')

    cw4 = self.new(:title  => 'jQuery 事件机制',
                   :desc   => 'jQuery 事件和原生事件的区别，以及如何获得原生事件。',
                   :attach => '/jquery_events.ppt')

    cw5 = self.new(:title  => 'jQuery DOM操作',
                   :desc   => '常用DOM操作方法',
                   :attach => '/jquery_dom.ppt')

    cw6 = self.new(:title  => 'jQuery 遍历和筛选',
                   :desc   => 'DOM树遍历最佳实践',
                   :attach => '/jquery_traverse.ppt')

    cw7 = self.new(:title  => 'jQuery 杂项工具',
                   :desc   => '动画队列和集合操作方法以及其他对原生对象的封装',
                   :attach => '/jquery_utilities.ppt')

    cw8 = self.new(:title  => 'jQuery 集合操作',
                   :desc   => '迁延对象(Deferred对象)详解，以及使用场景的介绍',
                   :attach => '/jquery_collection.ppt')

    [cw1, cw2, cw3, cw4, cw5, cw6, cw7, cw8]
  end
end
