# -*- coding: utf-8 -*-
module LoadData
  arr_1 = YAML.load_file(Rails.root.join("lib/data/entries/jquery1-2.yaml"))
  arr_2 = YAML.load_file(Rails.root.join("lib/data/entries/jquery3-4.yaml"))
  arr_3 = YAML.load_file(Rails.root.join("lib/data/entries/jquery5-6.yaml"))
  arr_4 = YAML.load_file(Rails.root.join("lib/data/entries/jquery7-8.yaml"))
  arr = arr_1 + arr_2 + arr_3 + arr_4

  def self.load_sections(array)
    array.map do |hash|
      section = Section.new(:title => hash["title"], :desc => hash["desc"])

      hash["entries"].each do |entries_hash|
        entry = Entry.new(:title => entries_hash["title"], :content => entries_hash["desc"])
        section.add_entry(entry)  
      end

      section
    end
  end
  BOOK_1_SECTIONS = load_sections arr
  BOOK_2_SECTIONS = load_sections YAML.load_file(Rails.root.join("lib/data/entries/ruby.yaml"))
  ######## 用户
  def self.users
    arr = YAML.load_file(Rails.root.join("lib/data/users.yaml"))
    arr.map do |hash|
      User.new :name => hash["name"], :logo_32 => hash["logo_32"], :logo_48 => hash["logo_48"]
    end
  end
  ####### 知识包列表
  def self.books
    arr = YAML.load_file(Rails.root.join('lib/data/books.yaml'))
    books = arr.map do |hash|
      Book.new :creator => User.find(hash["user_id"]), :desc => hash["desc"],
        :title => hash["title"], :cover_img => hash["cover_img"],
        :downloaded => hash["downloaded"], :progress => hash["progress"]
    end
    book_1 = books[0]
    book_2 = books[1]
    LoadData::BOOK_1_SECTIONS.each do |section|
      book_1.add_section(section)
    end

    LoadData::BOOK_2_SECTIONS.each do |section|
      book_2.add_section(section)
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
    entry_id = hash['entry_id']
    entry = nil
    entry = Entry.find(entry_id) if !entry_id.blank?
    Note.new :title => hash["title"], :content => hash["content"], :entry => entry
  end

  ####### 书签列表
  arr = YAML.load_file(Rails.root.join("lib/data/bookmark.yaml"))
  BOOKMARKS = arr.map do |bookmark|
    bm = Bookmark.new
    bm.title = bookmark['title']
    bm.entry_id = bookmark['entry_id']
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
  ####### 作业列表
  arr = YAML.load_file(Rails.root.join("lib/data/homeworks.yaml"))
  HOMEWORKS = arr.map do |hash|
    Homework.new :title => hash["title"], :content => hash["content"], :entry => Entry.find(hash["entry_id"])
  end
  ####### 课程
  arr = YAML.load_file(Rails.root.join("lib/data/courses.yaml"))
  COURSES = arr.map do |hash|
    Course.new :title => hash["title"], :desc => hash["desc"], :location => hash["location"]
  end
  ###### 重要词条
  arr = YAML.load_file(Rails.root.join("lib/data/important_notes.yaml"))
  IMPORTANTNOTES = arr.map do |hash|
    entry_id = hash["entry_id"]
    entry = Entry.find(entry_id)
    time = 3.days.ago - entry_id.hours +  entry_id.minute
    important_note = ImportantNote.new(:entry => entry, :number => hash["number"], :time => time)
    entry.important_note = important_note
  end
  ###### 导航
  arr = YAML.load_file(Rails.root.join("lib/data/nav_items.yaml"))
  result = NavItem.parse(arr)
  NAV_ITEMS = result[:items]
  NAV_ITEM_HASH = result[:item_hash]
  ##### 功能列表
  arr = YAML.load_file(Rails.root.join("lib/data/features.yaml"))
  FEATURES = arr.map do |hash|
    title = hash["title"]
    problem = hash["problem"]
    solution = hash["solution"]
    Feature.new(:title => title, :problem => problem, :solution => solution)
  end
  ##### 概述
  hash = YAML.load_file(Rails.root.join("lib/data/summary.yaml"))
  SUMMARY_DIRECTION_ITEMS = hash["direction"].map do |item|
    SummaryItem.new(:title => item["title"], :desc => item["desc"], :image => item["image"])
  end
  SUMMARY_STRATEGY_ITEMS = hash["strategy"].map do |item|
    SummaryItem.new(:title => item["title"], :desc => item["desc"], :image => item["image"])
  end
  SUMMARY_PRODUCT_ITEMS = hash["product"].map do |item|
    SummaryItem.new(:title => item["title"], :desc => item["desc"], :image => item["image"])
  end
  SUMMARY_ITEMS = SUMMARY_DIRECTION_ITEMS + SUMMARY_STRATEGY_ITEMS + SUMMARY_PRODUCT_ITEMS
  ##### 引用资料
  arr = YAML.load_file(Rails.root.join("lib/data/references.yaml"))
  REFERENCES = arr.map do |hash|
    title = hash["title"]
    desc = hash["desc"]
    url = hash["url"]
    Reference.new(:title => title, :desc => desc, :url => url)
  end
  ##### 场景
  arr = YAML.load_file(Rails.root.join("lib/data/mobile_scenes.yaml"))
  MOBILE_SCENES = arr.map do |hash|
    title = hash["title"]
    desc = hash["desc"]
    url = hash["url"]
    scene = Scene.new(:title => title, :url => url, :desc => desc)
    scene._build_pages(hash["pages"],"mobile")
    scene
  end

  arr = YAML.load_file(Rails.root.join("lib/data/web_scenes.yaml"))
  WEB_SCENES = arr.map do |hash|
    title = hash["title"]
    desc = hash["desc"]
    url = hash["url"]
    scene = Scene.new(:title => title, :url => url, :desc => desc)
    scene._build_pages(hash["pages"],"web")
    scene
  end

  SCENES = MOBILE_SCENES + WEB_SCENES

  page_hash = {}
  SCENES.map{|scene|scene.pages}.flatten.each do |page|
    page_hash[page.url] = page
  end
  PAGES_HASH = page_hash
end
