# -*- coding: utf-8 -*-
class User < DemoModel
  attr_accessor :name, :logo_32, :logo_48

  def self.make_all
    LoadData.users
  end
end