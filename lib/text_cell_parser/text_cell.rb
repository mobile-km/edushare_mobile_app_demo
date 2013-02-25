module TextCellParser


  class TextCell
    def initialize(hash,parent,order_number)
      @hash = hash
      @parent = parent
      @order_number = order_number
    end

    def id
      return @order_number if parent.blank?
      "#{parent.id}_#{@order_number}"
    end

    def url
      id
    end

    def level
      self.id.to_s.split("_").count
    end

    def title
      @hash["title"]
    end

    def desc
      @hash["desc"] || ""
    end

    def format
      TextCellParser::Format.new(@hash["format"]||"")
    end

    def attrs
      Helper.hash_array_to_ordered_hash(@hash["attrs"]||[])
    end

    def cover
      cover = @hash["cover"]
      return cover if !cover.blank?

      images = self.images
      return images.first.url if !images.blank?
      ""
    end

    def images
      return [] if @hash["images"].blank?
      [@hash["images"]].flatten.map do |data|
        TextCellParser::Image.new(data)
      end
    end

    def parent
      @parent
    end

    def ancestors
      arr = []

      raw_text_cell = self.parent
      while !raw_text_cell.blank?
        arr << raw_text_cell
        raw_text_cell = raw_text_cell.parent
      end

      arr.reverse
    end

    def is_ancestor_of?(another_text_cell)
      another_text_cell.ancestors.include?(self)
    end

    def siblings_and_self
      return TextCell.roots if parent.blank?

      parent.children
    end

    def siblings
      arr = siblings_and_self
      arr.delete self
      arr
    end

    def children
      children = @hash["children"]

      return TextCell._parse(children, self) if !children.blank?

      children_yaml = @hash["children_yaml"]
      if !children_yaml.blank?
        data = YAML.load_file(Rails.root.join(children_yaml))
        return TextCell._parse(data, self)
      end

      []
    end

    def prev_sibling
      text_cells = siblings_and_self
      index = text_cells.index(self)
      return nil if index == 0

      text_cells[index-1]
    end

    def next_sibling
      text_cells = siblings_and_self
      index = text_cells.index(self)
      return nil if index+1 == text_cells.length

      text_cells[index+1] 
    end

    def prev
      cell = prev_sibling
      return self.parent if cell.blank?
      return cell if cell.children.blank?

      cell = cell.children.last
      while !cell.children.blank?
        cell = cell.children.last
      end

      return cell
    end

    def next
      return self.children.first if !self.children.blank?

      cell = self
      result = cell.next_sibling
      while result.blank?
        cell = cell.parent
        return nil if cell.blank?
        result = cell.next_sibling
      end

      result
    end

    # 判断 text_cell 是否在指定的level范围内
    # 传两个参数和传一个参数时，逻辑有区别
    # from_level 和 to_level 大小关系可以正写或反写
    def is_match_level?(*args)
      levels = args.map{|arg|arg.to_i}.sort
      return levels[0] == self.level if levels.count == 1

      from_level = levels[0]
      to_level = levels[1]

      from_level.to_i <= self.level && to_level.to_i >= self.level
    end

    # 判断 text_cell 的指定 attr 的值是否等于指定的 value
    def is_match_attr?(attr_name, attr_value)
      attrs[attr_name.to_sym] == attr_value
    end

    # 判断 text_cell 的祖先中是否有指定 attr 值等于指定value的节点
    def is_match_ancestors_attr?(attr_name, attr_value)
      self.ancestors.each do |text_cell|
        return true if text_cell.is_match_attr?(attr_name, attr_value)
      end
      false
    end


    # 判断指定的 text_cell 和 another_text_cell 是否位于相同的子树
    # 如果 text_cell 和 another_text_cell 相同，返回 true
    # start_level 为起始比较层级，默认为 2
    def is_in_same_sub_tree?(another_text_cell, start_level=2)
      return true if self == another_text_cell

      text_cell_1 = self.get_ancestor_of_level(start_level)
      text_cell_2 = another_text_cell.get_ancestor_of_level(start_level)
      text_cell_1 == text_cell_2 && !!text_cell_2 
    end

    # 获取自身和自身的祖先节点中，level等于传入level的节点
    # 如果传入level大于当前节点level，则返回nil
    # 如果传入level等于当前节点level，则返回当前节点自身
    # 如果传入level小于当前节点level，则返回祖先节点对应level的节点
    # 其他异常情况，返回nil
    def get_ancestor_of_level(level)
      return nil if self.level < level.to_i
      return self if self.level == level.to_i

      self.ancestors.each do |text_cell|
        return text_cell if text_cell.level == level.to_i
      end
      
      nil
    end

    def ==(a)
      self.id == a.id
    end

    def method_missing(method,*attrs)
      result = method.to_s.match(/attr_(.*)/)
      return super if result.blank?
      attrs[result[1].to_sym]
    end

    def self.roots
      self._parse(TextCellParser::DATA, nil)
    end

    def self.by_url(url)
      self.by_id(url)
    end

    def self.by_id(id)
      ids = id.split("_").map{|id|id.to_i}

      result = nil
      id = ids.shift
      while !id.blank?
        cells = result.blank? ? self.roots : result.children
        result = cells[id-1]
        return nil if result.blank?
        id = ids.shift
      end
      
      result
    end

    def self._parse(raw_data,parent)
      result = []
      raw_data.each_with_index do |hash,index|
        result << TextCell.new(hash,parent,index+1)
      end
      result
    end

  
  end


end