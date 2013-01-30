# -*- coding: utf-8 -*-
class Note < DemoModel
  attr_accessor :entry, :desc

  def self.make_all
    8.times.map do |num|
      id = num + 1
      self.new :entry => Entry.find(id), :desc => "词条#{id}注解"
    end
  end

  def title
    "#{self.entry.title}笔记"
  end
end
