# -*- coding: utf-8 -*-
class Notebook < DemoModel
  attr_accessor :title, :desc

  def self.make_all
    # nb1 = self.new :title => 'jQuery教程(learning jQuery 1.3)笔记', :desc => '他是全球第一部 jQuery 著作,jQuery 官方网站推荐。以通俗易懂的方式介绍了jQuery的基本概念，主要包括jQuery的选择符、事件、特效、DOM操作、AJAX、表格操作、表单函数、拖曳与旋转和插件等内容，最后几章以实例操作为主，在前面内容的基础上，提出了常见的客户端实际问题并给出了其解决方案。本书是一本注重理论与实践结合的基础教程，适合Web开发人员阅读和参考。'
    # nb2 = self.new :title => 'ruby重构学习笔记', :desc => '1.发现ruby代码中的“坏味道”,2.逐步将糟糕的设计转变成设计精良的代码,3.构建测试以便保证重构正确进行,4.理解重构中的难点以及克服的办法,5.编写正确包装代码的方法,6.在对象之间移动特性，将其放在最适合的地方,7.将数据组织成更容易处理的形式,8.简化条件表达式，更高效地利用多态,9.创建更易于理解和使用的接口,10.进行大型重构，这将可能影响整个软件系统数月乃至数年,11.成功重构ruby on rails代码 '
    # nb3 = self.new :title => '.NET技术书籍推荐', :desc => '框架设计是我看的第一本真正意义上的.NET书籍，之前看过很多，但都是工具类的。如果仅仅把.NET作为开发程序的工具，那些书就足够了。但是.NET绝不仅仅是个工具，它是一种思想、一个平台。要想深入学习，必须对其Framework有所了解。'
    # nb4 = self.new :title => 'Think in Java阅读笔记', :desc => '很多人学习Java是从《Thinking in Java》这本书入手的，但是我认为这本书是不适合初学者的。我认为正确的使用这本书的方法应该是作为辅助的读物。《Thinking in Java》并不是在完整的介绍Java的整个体系，而是一种跳跃式的写作方法，是一种类似tips的方法来对Java很多知识点进行了深入的分析和解释。'
    # nb5 = self.new :title => 'C程序设计之四书五经', :desc => '这是迄今为止在所有程序设计语言书籍中最广受尊敬的一部经典，是任何一名C程序员的必读之作。因为出自C语言的设计者Dennis M．Ritchie和著名的计算机科学家Brian W．Kernighan之手，它被昵称为“K&R C”。是它首先引入了“Hello World!”程序，这个程序几乎成了后来任何一本入门性程序设计语言书籍中的第一个例子。'
    # nb6 = self.new :title => 'Erlang编程语言笔记', :desc => 'Erlang是一个结构化，动态类型编程语言，内建并行计算支持。最初是由爱立信专门为通信应用设计的，比如控制交换机或者变换协议等，因此非常适 合于构建分布式，实时软并行计算系统。'
    # nb7 = self.new :title => 'Real World Haskell想法', :desc => 'Haskell中对表达式求值的方式也是不同的。我们把所有的计算都推迟到其结果真的需要时： Haskell是惰性语言。惰性不只是移动下工作的事：它深刻的影响了我们如何写程序的方式'
    # nb8 = self.new :title => 'Restful Web Service理解', :desc => '对Restful概念以及http协议更深入的理解。'
    # nb9 = self.new :title => 'understading the linux kernel 3rd  LInux 学习', :desc => '想学习linux内核，我目前知道linux kernel development（不知是否写错了）不错'
    
    # nb10 = self.new :title => 'OO项目求生法则', :desc => '如何对项目进行跟踪并控制项目预算，如何在项目计划阶段确定影响项目成败的关键因素，以及在遇到麻烦时如何应付。 OO技术大师Cockburn针对如上问题'
    # nb11 = self.new :title => 'TCP/IP路由技术掌握', :desc => '各种常用的IP内部路由选择协议，包括RIP、RIPv2、EIGRP、OSPFv2、OSPFv3以及IS-IS协议。除了讲述每一种具体协议外，一些重要的主题，例如，路由重新分配、缺省路由与末梢路由选择、路由过滤、路由映射，以及支持IPv6的路由选择等。'
    # nb12 = self.new :title => '人工智能 了解', :desc => '研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。 人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。'
    # nb13 = self.new :title => '网格计算学习', :desc => '网格计算即分布式计算，是一门计算机科学。它研究如何把一个需要非常巨大的计算能力才能解决的问题分成许多小的部分，然后把这些部分分配给许多计算机进行处理，最后把这些计算结果综合起来得到最终结果。'
    # nb14 = self.new :title => '顶级游戏设计', :desc => 'Chris Crawford是计算机游戏设计界的元老,至今已经设计、发布了14款值得称道的游戏。'

    # [nb1, nb2, nb3, nb4, nb5, nb6, nb7, nb8, nb9, nb10, nb11, nb12, nb13, nb14]

    LoadData::NOTEBOOKS
  end
end
