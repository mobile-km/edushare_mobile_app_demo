module LoadData
  arr_1 = YAML.load_file(Rails.root.join("lib/data/entries/jquery1-2.yaml"))
  arr_2 = YAML.load_file(Rails.root.join("lib/data/entries/jquery3-4.yaml"))
  arr_3 = YAML.load_file(Rails.root.join("lib/data/entries/jquery5-6.yaml"))
  arr_4 = YAML.load_file(Rails.root.join("lib/data/entries/jquery7-8.yaml"))
  arr = arr_1 + arr_2 + arr_3 + arr_4

  BOOK_1_SECTIONS = arr.map do |hash|
    section = Section.new(:title => hash["title"])

    hash["entries"].each do |entries_hash|
      entry = Entry.new(:title => entries_hash["title"], :content => entries_hash["desc"])
      section.add_entry(entry)  
    end

    section
  end
  ####### 知识包列表
  def self.books
    arr = YAML.load_file(Rails.root.join('lib/data/books.yaml'))
    books = arr.map do |hash|
      Book.new :user => User.find(hash["user_id"]),:title => hash["title"], :cover_img => hash["cover_img"],
        :downloaded => hash["downloaded"], :progress => hash["progress"]
    end
    book_1 = books[0]
    LoadData::BOOK_1_SECTIONS.each do |section|
      book_1.add_section(section)
    end
    books
  end
  ####### 评论列表
  arr = YAML.load_file(Rails.root.join("lib/data/comments.yaml"))
  COMMENTS = arr.map do |hash|
    Comment.new :user => User.find(hash["user_id"]), :content => hash["content"]
  end
  #######  我的笔记本列表
  arr = YAML.load_file(Rails.root.join("lib/data/notebooks.yaml"))
  NOTEBOOKS = arr.map do |hash|
    Notebook.new :title => hash["title"], :desc => hash["desc"]
  end

  #######  我的笔记本列表 条目
  arr = YAML.load_file(Rails.root.join("lib/data/notes.yaml"))
  NOTES = arr.each_with_index.map do |hash, index|
    Note.new :entry => Entry.find(index + 1), :desc => hash["desc"]
  end

  ####### 书签列表
  arr = YAML.load_file(Rails.root.join("lib/data/bookmark.yaml"))
  BOOKMARKS = arr.map do |bookmark|
    bm = Bookmark.new
    bm.title = bookmark['title']
    bm.id = bookmark['id']
    bm
  end


  ####### 通知列表
  arr = YAML.load_file(Rails.root.join("lib/data/notice.yaml"))
  NOTICES = arr.map do |notice|
    Notice.new :title => notice['title'], :read_status => notice['read_status'], :desc => notice['desc']
  end
  ####### 课件列表
  arr = YAML.load_file(Rails.root.join("lib/data/coursewares.yaml"))
  COURSEWARES = arr.map do |hash|
    Courseware.new :title => hash["title"], :desc => hash["desc"], :entry => Entry.find(hash["entry_id"])
  end
end