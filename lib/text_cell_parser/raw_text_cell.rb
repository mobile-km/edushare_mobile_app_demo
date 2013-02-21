module TextCellParser


  class RawTextCell
    def initialize(hash,parent,order_number)
      @hash = hash
      @parent = parent
      @order_number = order_number
    end

    def id
      return @order_number if parent.blank?
      "#{parent.id}_#{@order_number}"
    end

    def level
      self.id.to_s.split("_").count
    end

    def title
      @hash["title"]
    end

    def desc
      @hash["desc"]
    end

    def attrs
      Helper.hash_array_to_ordered_hash(@hash["attrs"])
    end

    def parent
      @parent
    end

    def ancestor
      arr = []

      raw_text_cell = self.parent
      while !raw_text_cell.blank?
        arr << raw_text_cell
        raw_text_cell = raw_text_cell.parent
      end

      arr.reverse
    end

    def siblings
      arr = RawTextCell.roots if parent.blank?
      arr = parent.children
      arr.delete self
      arr
    end

    def children
      children = @hash["children"]

      return RawTextCell._parse(children, self) if !children.blank?

      children_yaml = @hash["children_yaml"]
      if !children_yaml.blank?
        data = YAML.load_file(Rails.root.join(children_yaml))
        return RawTextCell._parse(data, self)
      end

      []
    end

    def self.roots
      self._parse(TextCellParser::DATA, nil)
    end

    def self._parse(raw_data,parent)
      result = []
      raw_data.each_with_index do |hash,index|
        result << RawTextCell.new(hash,parent,index+1)
      end
      result
    end

  
  end


end