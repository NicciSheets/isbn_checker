require 'csv'
require_relative 'isbn_checker_refactor.rb'

csv_data = CSV.read('csv_file.csv')

def csv_data_input(csv_data)
	string_data = csv_data.map {|row| row.map {|cell| cell.to_s } }
	# p string_data
	# p string_data.class
	# p string_data.length
	string_data.shift
	string_data
	# p string_data[0][1]
	# p string_data[1]
	i = 0  # the index of the column you want to delete
	string_data.each do |row|
	  row.delete_at i
	end
end

def csv_validation(csv_data)
	csv_isbn = csv_data_input(csv_data)
	csv_isbn2 = csv_isbn.flatten
	csv_isbn2
	csv_validity = []
	csv_isbn2.each do |isbn|
		csv_validity << isbn_validation(isbn)
	end
	csv_validity
	a = csv_isbn2
	b = csv_validity
	big_array = a.zip(b)
end

header = ["ISBN", "VALIDITY"]

CSV.open("output_csv_isbn.csv", "wb") do |csv|
	csv << header
	csv_validation(csv_data).each do |m|
		csv << m 
	end
end 

#headers = csv_data.shift.map {|i| i.to_s }
# p csv_validation(csv_data)