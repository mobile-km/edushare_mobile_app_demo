# -*- coding: utf-8 -*-
class Work < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    self.new :title => "java面向对象 章节二的作业", :desc => "描述java第二节的现象介绍"
  end

end
