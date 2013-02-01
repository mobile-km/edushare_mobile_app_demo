# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    Book.find(1).sections[0].entries
  end

  def number
    self.id * 2
  end
end
