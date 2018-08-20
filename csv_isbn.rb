CSV.foreach('my_file.csv', headers: true, header_converters: :symbol) do |row|
  puts row.to_h[:foo]
  puts row.to_h[:bar]