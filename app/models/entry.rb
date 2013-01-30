# -*- coding: utf-8 -*-
class Entry < DemoModel
  attr_accessor :section, :title, :content

  def self.make_all
    e1 = self.new :title => 'jQuery.ajax()方法', :content => '执行一次异步HTTP(Ajax)请求。'
    e2 = self.new :title => 'jQuery.ajaxPrefilter()方法', :content => '在每次请求发送以及被处理之前，预处理定制的Ajax选项或者修改已有的选项'
    e3 = self.new :title => 'jQuery.ajaxSetup()方法', :content => '为以后每次请求设置默认参数。'
    e4 = self.new :title => 'jQuery.param()方法', :content => '为一个数组或者对象创建一个序列化的表现，适合用在URL查询参数或者Ajax请求里。'
    e5 = self.new :title => 'jQuery.fn.serialize()方法', :content => '把表单元素编码成字符串以便在请求发送的时候提交。'
    e6 = self.new :title => 'jQuery.fn.serializeArray()方法', :content => '把表单元素编码成键值对数组。'
    e7 = self.new :title => 'jQuery.ajaxTransport()方法', :content => '创建一个实际处理Ajax数据传输的对象。'
    e8 = self.new :title => 'jQuery.fn.load()方法', :content => '从服务器异步载入数据并把返回的HTML插入到选择器对应的元素里。'

    [e1, e2, e3, e4, e5, e6, e7, e8]
  end
end
