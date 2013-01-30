# -*- coding: utf-8 -*-
class Notebook < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    8.times.map do |num|
      id = num + 1
      self.new :title => "笔记本#{id}", :desc => "笔记本#{id}介绍"
    end
  end
end
