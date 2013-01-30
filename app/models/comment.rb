# -*- coding: utf-8 -*-
class Comment < DemoModel
  attr_accessor :user, :content

  def self.make_all
    c1 = self.new :user => User.find(1), :content => '为什么我每次success都没有执行？'
    c2 = self.new :user => User.find(2), :content => '你请求结果的status code是什么？'
    c3 = self.new :user => User.find(1), :content => '我看了下，是422。有什么问题么？'
    c4 = self.new :user => User.find(3), :content => '如果我没记错的话，只有status code是2xx~3xx的时候才会触发success.'
    c5 = self.new :user => User.find(1), :content => '我试了下果然是这个问题，太谢谢大家了，这问题困扰我好久了。'
    c6 = self.new :user => User.find(2), :content => ':-)'

    [c1, c2, c3, c4, c5, c6]
  end
end
