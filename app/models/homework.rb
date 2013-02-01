# coding: utf-8
class Homework < DemoModel
  attr_accessor :title, :content, :entry

  def self.make_all
    LoadData::HOMEWORKS
  end
  
  def self.ajax_related
    self.all[0, 3]
  end
end
