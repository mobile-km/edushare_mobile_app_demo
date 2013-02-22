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

    def attrs
      Helper.hash_array_to_ordered_hash(@hash["attrs"]||[])
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