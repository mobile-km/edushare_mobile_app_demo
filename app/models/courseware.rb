# -*- coding: utf-8 -*-
class Courseware < DemoModel
  attr_accessor :title, :attach, :desc, :entry

  def self.make_all
    LoadData::COURSEWARES
  end

  def self.entry1_related
    all[0..1]
  end
end
