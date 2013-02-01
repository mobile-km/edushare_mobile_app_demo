# -*- coding: utf-8 -*-
class Comment < DemoModel
  attr_accessor :user, :content

  def self.make_all
    LoadData::COMMENTS
  end
end
