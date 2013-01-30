# -*- coding: utf-8 -*-
class Note < DemoModel
  attr_accessor :entry, :desc

  def self.make_all
    n1 = self.new :entry => Entry.find(1), :desc => '在jQuery里发起Ajax请求的标准方法。'
    n2 = self.new :entry => Entry.find(2), :desc => '可以用来预处理某些http请求头。'
    n3 = self.new :entry => Entry.find(3), :desc => '可以用来设置常用的请求参数。'
    n4 = self.new :entry => Entry.find(4), :desc => '这个和serialize()有什么区别呢？'
    n5 = self.new :entry => Entry.find(5), :desc => '用来序列化Ajax请求发送的数据，似乎在内部调用了param()方法。'
    n6 = self.new :entry => Entry.find(6), :desc => '会把每个表单域转换成键值对{name:name, value:value}的键值对，然后存到一个数组里。'
    n7 = self.new :entry => Entry.find(7), :desc => '被ajax()方法调用，创建一个ajax()请求的方法，可以发起和中断请求。比较高级的请求定制方式。'
    n8 = self.new :entry => Entry.find(8), :desc => '可以用来动态的在页面插入请求获得的HTML片段。'

    [n1, n2, n3, n4, n5, n6, n7, n8]
  end

  def title
    "笔记: #{self.entry.title}"
  end
end
