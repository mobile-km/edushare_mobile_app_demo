arr_1 = YAML.load_file(Rails.root.join("lib/data/entries/jquery1-2.yaml"))
arr_2 = YAML.load_file(Rails.root.join("lib/data/entries/jquery3-4.yaml"))
arr_3 = YAML.load_file(Rails.root.join("lib/data/entries/jquery5-6.yaml"))
arr_4 = YAML.load_file(Rails.root.join("lib/data/entries/jquery7-8.yaml"))
arr = arr_1 + arr_2 + arr_3 + arr_4

book = Book.find(1)
arr.each do |hash|
  section = Section.new(:title => hash["title"])

  hash["entries"].each do |entries_hash|
    entry = Entry.new(:title => entries_hash["title"], :content => entries_hash["desc"])
    section.add_entry(entry)  
  end

  book.add_section(section)
end