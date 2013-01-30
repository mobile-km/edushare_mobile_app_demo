# -*- coding: utf-8 -*-
class Notebook
  attr_accessor :title, :desc

  def initialize options
    @title = options[:title]
    @desc  = options[:desc]
  end

  def self.all
    @all ||= self.make_all
  end

  def self.make_all
    8.times.map do |num|
      self.new :title => "jQuery笔记#{num}", :desc => "jQuery笔记#{num}"
    end
  end
end