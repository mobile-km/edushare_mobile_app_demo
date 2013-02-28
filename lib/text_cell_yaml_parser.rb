class TextCellYamlParser
  CONFIG = YAML.load_file(Rails.root.join("config/text_cell_config.yaml"))

  class TextCell
    def initialize(hash)
      @hash = hash
    end

    def hash
      @hash
    end

    def children
      children = @hash["children"]

      return TextCell._parse(children) if !children.blank?

      children_yaml = @hash["children_yaml"]
      if !children_yaml.blank?
        data = YAML.load_file(Rails.root.join(children_yaml))
        return TextCell._parse(data)
      end

      []
    end

    def self._parse(hashs)
      hashs.map do |hash|
        TextCell.new(hash)
      end
    end

    def self.roots(yaml_file_path = "lib/text_cell_data/nav_items.yaml")
      self._parse(YAML.load_file(Rails.root.join(yaml_file_path)))
    end

  end
end