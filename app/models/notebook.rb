# -*- coding: utf-8 -*-
class Notebook < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    8.times.map do |num|
      self.new :title => "jQuery笔记#{num}", :desc => "jQuery笔记#{num}"
    end
  end
end
