# -*- coding: utf-8 -*-
class User < DemoModel
  attr_accessor :name, :logo_32, :logo_48

  def self.make_all
    user_1 = User.new(:name => '诸葛亮', :logo_48 => '/assets/user_zhugeliang_48.jpg', :logo_32 => '/assets/user_zhugeliang_32.jpg')
    user_2 = User.new(:name => '庞统', :logo_48 => '/assets/user_pangtong_48.jpg', :logo_32 => '/assets/user_pangtong_32.jpg')
    user_3 = User.new(:name => '赵云', :logo_48 => '/assets/user_zhaoyun_48.jpg', :logo_32 => '/assets/user_zhaoyun_32.jpg')
    [user_1,user_2,user_3]
  end
end