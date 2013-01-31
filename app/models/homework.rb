# coding: utf-8
class Homework < DemoModel
  attr_accessor :title, :content

  def self.make_all
    k1_1 = self.new
    k1_1.title = '使用 post 方式完成一个 ajax 请求'
    k1_1.content = '这是一个简单的 POST 请求功能以取代复杂 $.ajax. 请求成功时可调用回调函数。如果需要在出错时执行函数，请使用 $.ajax.'

    k1_2 = self.new
    k1_2.title = '设计一个类似 facebook 弹出窗'
    k1_2.content = '在faceBook上，几乎每个页面的下面带有聊天工具栏，有 "弹出聊天窗口" 的功能，点击可以弹出一个窗口C，之后变成 "弹回聊天窗口"'

    k1_3 = self.new
    k1_3.title = '封装一个通用表单较验方法'
    k1_3.content = '使用jQuery限制表单输入框的字符格式，并自动按要求转换格式，我们把它起个名字叫做jQueryinputMask，它一共有四种方式'


    k1_4 = self.new
    k1_4.title = '完成一个计算器程序'
    k1_4.content = '使用javaScript实现一个简单的计算器，只要一个记事本即可完成'


    k1_5 = self.new
    k1_5.title = '用 jquery 改变 CSS 样式'
    k1_5.content = 'jQuery提供css()的方法来实现嵌入式改变元素样式，css()方法在使用上具有多样性。其中一种接受两个输入参数：样式属性和样式值，它们之间用逗号分开'


    k1_6 = self.new
    k1_6.title = '自写的一个jQuery圆角插件'
    k1_6.content = '下面介绍自己写的一个jQuery圆角的插件，功能非常简单。目前只能实现1px的固定弧度的圆角矩形边框。'

    [k1_1, k1_2, k1_3, k1_4, k1_5, k1_6]
  end
  
end