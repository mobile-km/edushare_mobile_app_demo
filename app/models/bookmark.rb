# coding: utf-8
class Bookmark < DemoModel
  attr_accessor :title

  def self.list_all
    entries = Book.find(1).sections[1].entries
    entry_1 = entries[rand(entries.length)]

    entries = Book.find(1).sections[2].entries
    entry_2 = entries[rand(entries.length)]

    entries = Book.find(1).sections[3].entries
    entry_3 = entries[rand(entries.length)]

    entries = Book.find(1).sections[4].entries
    entry_4 = entries[rand(entries.length)]

    entries = Book.find(1).sections[5].entries
    entry_5 = entries[rand(entries.length)]

    [entry_1, entry_2, entry_3, entry_4, entry_5]
  end


  def self.make_all
    [0, 1, 2, 3, 4]
  end
  
end