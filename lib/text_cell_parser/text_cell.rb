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

    def find_ancestor_by_level(level)
      self.ancestors.each do |text_cell|
        return text_cell if text_cell.level == level.to_i
      end
      nil
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

    def is_match_level?(*args)
      levels = args.map{|arg|arg.to_i}.sort
      return levels[0] == self.level if levels.count == 1

      from_level = levels[0]
      to_level = levels[1]

      from_level.to_i <= self.level && to_level.to_i >= self.level
    end

    def is_match_attr?(attr_name, attr_value)
      attrs[attr_name.to_sym] == attr_value
    end

    def is_match_ancestors_attr?(attr_name, attr_value)
      self.ancestors.each do |text_cell|
        return true if text_cell.is_match_attr?(attr_name, attr_value)
      end
      false
    end

    def is_in_same_sub_tree?(another_text_cell, start_level=2)
      text_cell_1 = self.find_ancestor_by_level(start_level)
      text_cell_2 = another_text_cell.find_ancestor_by_level(start_level)
      text_cell_1 == text_cell_2 && !!text_cell_2 
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