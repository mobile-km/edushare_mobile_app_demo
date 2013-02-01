# coding: utf-8
class Section < DemoModel
  attr_accessor :title, :entries, :book, :desc

  def self.make_all
    Book.find(1).sections
  end

  def add_entry(entry)
    self.entries ||= []
    self.entries << entry
    entry.section = self
  end

end
