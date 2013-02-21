module TextCellParser
  CONFIG = YAML.load_file(Rails.root.join("config/text_cell_config.yaml"))
  DATA = YAML.load_file(Rails.root.join("lib/text_cell_data/nav_items.yaml"))
end