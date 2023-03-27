require 'csv'

CSV.generate do |csv|
  csv_column_names = ["製品名","仕入先"]
  csv << csv_column_names
  @parts.each do |part|
    csv_column_values = [
      part.part_name,
      part.client.client_name,
    ]
    csv << csv_column_values
  end
end