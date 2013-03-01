PTextCell.destroy_all

yaml_file_path = ARGV[0]
if !yaml_file_path.blank?
  if !File.exists?(yaml_file_path)
    p "#{yaml_file_path} 文件不存在"
    exit 1
  end
  roots = TextCellYamlParser::TextCell.roots(yaml_file_path)
else
  roots = TextCellYamlParser::TextCell.roots
end

# roots(yaml_file_path = "lib/text_cell_data/nav_items.yaml")

def yaml_to_text_cell(yaml_text_cell, parent_text_cell = nil)
  hash = yaml_text_cell.hash

  tc = PTextCell.new
  tc.title = hash["title"]
  tc.desc = hash["desc"]
  # tc.images = [hash["images"]].flatten
  # tc.rcover = hash["cover"]
  tc.rformat = hash["format"]
  if !parent_text_cell.blank?
    tc.parent = parent_text_cell
  end
  tc.save
  tc.update_attrs(hash["attrs"]) if !hash["attrs"].blank?
  p "#{tc.order} save success"

  yaml_text_cell.children.each do |child_yaml_text_cell|
    yaml_to_text_cell(child_yaml_text_cell, tc)
  end
end

roots.each do |yaml_text_cell|
  yaml_to_text_cell(yaml_text_cell)
end