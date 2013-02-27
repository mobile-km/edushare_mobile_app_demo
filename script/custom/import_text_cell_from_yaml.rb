PTextCell.destroy_all

roots = TextCellYamlParser::TextCell.roots

def yaml_to_text_cell(yaml_text_cell, parent_text_cell = nil)
  hash = yaml_text_cell.hash

  tc = PTextCell.new
  tc.title = hash["title"]
  tc.desc = hash["desc"]
  tc.attrs = hash["attrs"]
  tc.images = [hash["images"]].flatten
  tc.cover = hash["cover"]
  tc.rformat = hash["format"]
  if !parent_text_cell.blank?
    tc.parent = parent_text_cell
  end
  tc.save
  p "#{tc.order} save success"

  yaml_text_cell.children.each do |child_yaml_text_cell|
    yaml_to_text_cell(child_yaml_text_cell, tc)
  end
end

roots.each do |yaml_text_cell|
  yaml_to_text_cell(yaml_text_cell)
end