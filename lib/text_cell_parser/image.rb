module TextCellParser

  class Image
    def initialize(data)
      @data = data
    end

    def url
      @data["image"]
    end

    def alt
      @data["alt"]
    end
  end
end