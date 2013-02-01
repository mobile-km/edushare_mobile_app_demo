# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    Book.find(1).sections[0].entries
  end

  def self.search(word)
    keyword = word.downcase
    self.all.select do |e|
      e.title.include?(keyword) || e.content.include?(keyword)
    end.uniq
  end

  def number
    self.id * 2
  end
end
