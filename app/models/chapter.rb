# coding: utf-8
class Chapter < DemoModel
  attr_accessor :title, :content

  def self.make_all
    b2_1 = self.new
    b2_1.title = 'Global Ajax Event Handlers'
    b2_1.content = "These methods register handlers to be called when certain events, such as initialization or completion, take place for any AJAX request on the page. The global events are fired on each AJAX request if the global"


    b2_2 = self.new
    b2_2.title = 'helper-functions'
    b2_2.content = 'These functions assist with common idioms encountered when performing AJAX tasks.'


    b2_3 = self.new
    b2_3.title = 'Low-Level Interface'
    b2_3.content = 'These methods can be used to make arbitrary AJAX requests.'


    b2_4 = self.new
    b2_4.title = 'Shorthand Methods'
    b2_4.content = 'These methods perform the more common types of AJAX requests in less code.'


    [b2_1, b2_2, b2_3, b2_4]
  end
  
end