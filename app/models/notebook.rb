# -*- coding: utf-8 -*-
class Notebook < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    nb1 = self.new :title => 'jQuery学习笔记', :desc => '记录了学习jQuery遇到的问题和想法。'
    nb2 = self.new :title => 'ruby重构学习笔记', :desc => 'ruby重构的阅读心得。'
    nb3 = self.new :title => 'Java重构笔记', :desc => '自己根据各种涉及的重构技巧写的一些例子和理解。'
    nb4 = self.new :title => 'Think in Java阅读笔记', :desc => '每天一篇，坚持写读书笔记。'
    nb5 = self.new :title => 'Head first Java心得', :desc => '结合Think in Java产生的理解。'
    nb6 = self.new :title => 'Erlang编程语言笔记', :desc => '记录对Erlang语言的初步理解。'
    nb7 = self.new :title => 'Real World Haskell想法', :desc => '记录对Haskell语言的初步理解。'
    nb8 = self.new :title => 'Restful Web Service理解', :desc => '对Restful概念以及http协议更深入的理解。'

    [nb1, nb2, nb3, nb4, nb5, nb6, nb7, nb8]
  end
end
