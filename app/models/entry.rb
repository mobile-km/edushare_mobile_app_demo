# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    Section.all.map do |section|
      section.entries
    end.flatten
  end

end
