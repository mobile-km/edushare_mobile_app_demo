# coding: utf-8
class Bookmark < DemoModel
  attr_accessor :title, :entry_id

  def self.make_all
    LoadData::BOOKMARKS
  end
  
end