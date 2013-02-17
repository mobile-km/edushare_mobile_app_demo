class NavItem < DemoModel
  attr_accessor :title, :url, :parent, :children, :prev, :next

  def self.items
    LoadData::NAV_ITEMS
  end

  def self.parse(arr)
    Parse.new(arr).result
  end

  def _set_prev(prev)
    return if prev.blank?
    self.prev = prev
    prev.next = self
  end

  class Parse
    def initialize(arr)
      @arr = arr
      @current_parent = nil
      @last_item = nil
    end

    def result
      _parse_array(@arr)
    end

    def _parse_array(array)
      array.map do |hash|
        title = hash["title"]
        url = hash["url"]

        item = NavItem.new(:title => title, :url => url, :parent => @current_parent)
        item._set_prev(@last_item)
        @last_item = item

        c_arr = hash["children"]
        if !c_arr.blank?
          parent = @current_parent
          @current_parent = item

          children = _parse_array(c_arr) 

          @current_parent = parent
        end

        item
      end
    end
  end
end