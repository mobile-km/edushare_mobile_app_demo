# -*- coding: utf-8 -*-
class ImportantNote < DemoModel
  attr_accessor :number, :time, :entry
  delegate :title, :to => :entry
 
  def self.make_all
    LoadData::IMPORTANTNOTES
  end
end
