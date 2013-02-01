# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    Book.find(1).sections.map(&:entries).flatten
  end

  def self.search(word)
    keyword = word.downcase
    self.all.select do |e|
      e.title.downcase.include?(keyword) ||
      e.content.downcase.include?(keyword)
    end
  end

  def number
    self.id * 2 + 1 
  end
end
