# coding: utf-8
class Book < DemoModel
  attr_accessor :title, :cover_img, :sections, :downloaded, :progress

  def add_section(section)
    self.sections ||= []
    self.sections << section
    section.book = self
  end

  def self.my
    books = Book.all
    downloaded_books = books[0..1]
    downloading_books = books[4]
    my_books = downloaded_books + [books[4]]
    my_books
  end

  def self.make_all
    LoadData.books
  end
  
end