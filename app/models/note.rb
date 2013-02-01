# -*- coding: utf-8 -*-
class Note < DemoModel
  attr_accessor :entry, :desc

  def self.make_all
    LoadData::NOTES
  end
end
