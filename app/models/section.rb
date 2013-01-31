# coding: utf-8
class Section < DemoModel
  attr_accessor :title, :entries

  def self.make_all
    @section_jquery7_8 = self.load_yaml('jquery7-8')
    @section_jquery3_4 = self.load_yaml('jquery3-4')
    @section_jquery5_6 = self.load_yaml('jquery5-6')
    [@section_jquery3_4, @section_jquery5_6, @section_jquery7_8].flatten
  end

  def self.load_yaml(file)
    data = YAML.load(File.open "lib/data/entries/#{file}.yaml").map do |section_hash|
      section = self.new section_hash
      section.entries = section_hash['entries'].map do |entry_hash|
        entry = Entry.new
        entry.section = section
        entry.title = entry_hash['title']
        entry.content = entry_hash['desc']
        entry
      end

      section
    end
  end
  
end
