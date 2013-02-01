# -*- coding: utf-8 -*-
class Notice < DemoModel
  attr_accessor :title, :read_status, :desc

  def self.make_all
    LoadData::NOTICES
  end
end
