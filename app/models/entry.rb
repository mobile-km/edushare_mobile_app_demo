# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    @jquery7_8 = self.load_jquery_entries('7-8')
    [@jquery7_8]
  end

  def self.load_jquery_entries(sections)
    YAML.load File.open("lib/data/entries/jquery#{sections}.yaml")
  end
end
