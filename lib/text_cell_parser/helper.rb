module TextCellParser


  class Helper
    # [{:a=>1},{:b=>2}] -> #<OrderedHash {:a=>1, :b=>2}>
    # ActiveSupport::OrderedHash
    def self.hash_array_to_ordered_hash(hash_array)
      ordered_hash = ActiveSupport::OrderedHash.new

      hash_array.each do |hash|
        key = hash.keys.first
        value = hash[key]
        ordered_hash[key.to_sym] = value
      end

      ordered_hash
    end
  end
end