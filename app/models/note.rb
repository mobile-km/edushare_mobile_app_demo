# -*- coding: utf-8 -*-
class Note < DemoModel
  attr_accessor :entry, :desc

  def self.make_all
    n1 = self.new :entry => Entry.find(1), :desc => '执行一个异步的HTTP（Ajax）的请求。一个以"{键:值}"组成的AJAX 请求设置。所有选项都是可选的。可以使用$.ajaxSetup()设置任何默认参数。看jQuery.ajax( settings )下所有设置的完整列表。'
    n2 = self.new :entry => Entry.find(2), :desc => '当Ajax请求完成后注册一个回调函数。这是一个 AjaxEvent。每当一个Ajax请求完成，jQuery就会触发ajaxComplete事件，在这个时间点所有处理器会使用.ajaxComplete()方法注册并执行。'
    n3 = self.new :entry => Entry.find(3), :desc => 'Ajax请求出错时注册一个回调处理函数，这是一个 Ajax Event。每当一个Ajax请求出错时，jQuery就会触发ajaxError事件，在这个时间点所有处理函数会使用.ajaxError()方法注册并执行。'
    n4 = self.new :entry => Entry.find(4), :desc => '在Ajax请求发送之前绑定一个要执行的函数，这是一个 Ajax Event.每当一个Ajax请求即将发送，jQuery就会触发ajaxSend事件，在这个时间点所有处理函数都会使用.ajaxSend()方法注册并执行。'
    n5 = self.new :entry => Entry.find(5), :desc => '在AJAX 请求刚开始时执行一个处理函数。 这是一个 Ajax Event.每当一个Ajax请求即将发送，jQuery检查是否有任何其他响应过程中的Ajax请求。如果没有检查到，jQuery就会触发ajaxStart事件，在这个时间点所有处理函数都会使用.ajaxStart()方法注册并执行。'
    n6 = self.new :entry => Entry.find(6), :desc => '在AJAX 请求完成时执行一个处理函数。 这是一个 Ajax Event。每当一个Ajax请求完成，jQuery检查是否有任何其他响应过程中的Ajax请求。如果都执行完成，jQuery就会触发ajaxStop事件，在这个时间点所有处理函数都会使用.ajaxStop()方法注册并执行。如果一个未处理完成的Ajax请求用beforeSend回调函数返回false取消，ajaxStop事件也被触发'
    n7 = self.new :entry => Entry.find(7), :desc => '绑定一个函数当 Ajax 请求成功完成时执行。 这是一个Ajax Event.每当一个Ajax请求成功完成，jQuery就会触发ajaxSuccess事件，在这个时间点所有处理函数都会使用.ajaxSuccess()方法注册并执行。'
    n8 = self.new :entry => Entry.find(8), :desc => '执行一个异步的HTTP（Ajax）的请求。一个以"{键:值}"组成的AJAX 请求设置。所有选项都是可选的。可以使用$.ajaxSetup()设置任何默认参数。看jQuery.ajax( settings )下所有设置的完整列表。'

    [n1, n2, n3, n4, n5, n6, n7, n8]
  end

  def title
    "笔记: #{self.entry.title}"
  end
end
