PTextCell.destroy_all
Attr.destroy_all
Image.destroy_all

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

def yaml_to_text_cell(yaml_text_cell, parent_text_cell = nil)
  text_cell_hash = yaml_text_cell.hash

  tc = PTextCell.new
  tc.title = text_cell_hash["title"]
  tc.desc = text_cell_hash["desc"]

  if !text_cell_hash["cover"].blank?
    cover_path = Rails.root.join(text_cell_hash["cover"])
    if !File.exists?(cover_path)
      raise "#{cover_path} 文件不存在"
    end
    tc.cover = File.open(Rails.root.join(text_cell_hash["cover"]))
  end

  
  tc.rformat = text_cell_hash["format"]
  if !parent_text_cell.blank?
    tc.parent = parent_text_cell
  end

  tc.save

  if !text_cell_hash["images"].blank?
    [text_cell_hash["images"]].flatten.each do |hash|
      tc.images.create(
        :image => File.open(Rails.root.join(hash["image"])),
        :alt => hash["alt"]
      )
    end
  end

  if !text_cell_hash["attrs"].blank?
    text_cell_hash["attrs"].each do |hash|
      arr = hash.to_a.flatten
      tc.rattrs.create(:key => arr[0], :value => arr[1])
    end
  end

  p "#{tc.order} save success"

  yaml_text_cell.children.each do |child_yaml_text_cell|
    yaml_to_text_cell(child_yaml_text_cell, tc)
  end
end

roots.each do |yaml_text_cell|
  yaml_to_text_cell(yaml_text_cell)
end