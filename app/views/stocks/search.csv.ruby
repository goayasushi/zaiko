require 'csv'
bom = %w[EF BB BF].map { |e| e.hex.chr }.join

CSV.generate(bom) do |csv|
  csv_column_names = ["部品コード","部品名","仕入先名","仕入単価(税抜)","入庫数","出庫数","在庫数","実在庫数"]
  csv << csv_column_names
  @parts.each do |part|
    purchase_total = @purchases.select{ |x| x[:part_id] == part.id }.sum{ |x| x[:purchase_quantity]}
    sale_total = @sales.select{ |x| x[:part_id] == part.id }.sum{ |x| x[:sale_quantity]}
    stock_total = purchase_total - sale_total
    csv_column_values = [
      part.id,
      part.part_name,
      part.client.client_name,
      part.purchase_price,
      purchase_total,
      sale_total,
      stock_total,
    ]
    csv << csv_column_values
  end
end