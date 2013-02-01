# coding: utf-8
class Bookmark < DemoModel
  attr_accessor :title, :id

  def self.make_all
    bookmarks = YAML.load_file(Rails.root.join("lib/data/bookmark.yaml"))
    bm_arr = bookmarks.map do |bookmark|
      bm = Bookmark.new
      bm.title = bookmark['title']
      bm.id = bookmark['id']
      bm
    end
  end
  
end