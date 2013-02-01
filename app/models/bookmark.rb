# coding: utf-8
class Bookmark
  attr_accessor :title, :url

  def self.all
    @all ||= self.make_all
  end

  def self.make_all
    
  end
  
end