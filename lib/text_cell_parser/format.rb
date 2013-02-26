module TextCellParser


  class Format
    # "xxx:abc;yyy:def;"
    def initialize(formats_str)
      @formats = {}
      formats_str.split(";").each do |format_str|
        arr = format_str.split(":")
        @formats[arr[0].to_sym] = arr[1]
      end
    end

    def method_missing(method,*attrs)
      @formats[method]
    end

  end
end