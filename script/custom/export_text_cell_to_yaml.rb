hash = PTextCell.roots.map do |text_cell|
  text_cell.to_hash
end

yaml = hash.ya2yaml(:syck_compatible => false)
File.open(Rails.root.join("lib/text_cell_data/export.yaml"),"w") do |f|
  f << yaml
end