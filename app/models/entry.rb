# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    8.times.map do |num|
      id = num + 1
      self.new :title => "词条#{id}", :content => "词条#{id}内容"
    end
  end
end
