module TextCellParser


  class TextCell
    def initialize(raw_text_cell)
      @raw_text_cell = raw_text_cell
    end

    def raw_text_cell
      @raw_text_cell
    end

    def level
      raw_text_cell.level
    end

    def title
      raw_text_cell.title
    end

    def desc
      raw_text_cell.desc
    end

    def attrs
      raw_text_cell.attrs
    end

    def images
      raw_text_cell.images
    end

    def sub_text_cells
      raw_text_cell.children.map{|child| TextCell.new(child)}
    end

    def parent_text_cell
      return nil if self.level-1 == TextCellParser::Config.nav_level
      TextCell.new(raw_text_cell.parent)
    end

    def method_missing(method,*attrs)
      result = method.to_s.match(/attr_(.*)/)
      return super if result.blank?

      raw_text_cell.attrs[result[1].to_sym]
    end

  end

end