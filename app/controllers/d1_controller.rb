class D1Controller < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end
end