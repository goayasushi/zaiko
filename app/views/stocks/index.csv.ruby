require 'csv'
bom = %w[EF BB BF].map { |e| e.hex.chr }.join

CSV.generate(bom) do |csv|
  csv_column_names = ["部品コード","部品名","仕入先名","仕入単価(税抜)","入庫数","出庫数","在庫数","実在庫数"]
  csv << csv_column_names
  @parts.each do |part|
    csv_column_values = [
      part.id,
      part.part_name,
      part.client.client_name,
      part.purchase_price,
      Purchase.totle_purchase_quantity(part.id),
      Sale.totle_sale_quantity(part.id),
      Purchase.totle_purchase_quantity(part.id) - Sale.totle_sale_quantity(part.id),
    ]
    csv << csv_column_values
  end
end