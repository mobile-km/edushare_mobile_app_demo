# -*- coding: utf-8 -*-
class Notebook < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    LoadData::NOTEBOOKS
  end
end
