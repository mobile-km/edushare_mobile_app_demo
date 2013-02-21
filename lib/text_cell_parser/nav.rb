module TextCellParser


  class Nav
    def initialize(raw_text_cell)
      @raw_text_cell = raw_text_cell
    end

    def level
      raw_text_cell.level
    end

    def title
      raw_text_cell.title
    end

    def url
      raw_text_cell.id
    end

    def raw_text_cell
      @raw_text_cell
    end

    def parent
      return nil if raw_text_cell.parent.blank?
      Nav.new(raw_text_cell.parent)
    end

    def ancestor
      arr = []

      nav = self.parent
      while !nav.blank?
        arr << nav
        nav = nav.parent
      end

      arr.reverse
    end

    def siblings
      raw_text_cell.siblings.map{|sibling| Nav.new(sibling)}
    end

    def children
      return [] if self.level == TextCellParser::Config.nav_level
      raw_text_cell.children.map{|child| Nav.new(child)}
    end

    def text_cells
      return [] if self.level != TextCellParser::Config.nav_level
      raw_text_cell.children.map{|child| TextCell.new(child)}
    end

    def self.root_navs
      self._parse(TextCellParser::RawTextCell.roots)
    end

    def self._parse(raw_text_cells)
      raw_text_cells.map do |raw_text_cell|
        Nav.new(raw_text_cell)
      end
    end

  end


end