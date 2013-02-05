# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content, :important_note

  def self.make_all
    Book.all.map do |book|
      book.sections ? book.sections.map(&:entries) : []
    end.flatten
  end

  def self.search(word)
    keyword = word.downcase
    self.all.select do |e|
      e.title.downcase.include?(keyword) ||
      e.content.downcase.include?(keyword)
    end
  end

  def self.homework_related
    [1, 4, 8, 9].map {|id| self.find(id)}
  end

  def important_number
    important_note.blank? ? 0 : important_note.number
  end
end
