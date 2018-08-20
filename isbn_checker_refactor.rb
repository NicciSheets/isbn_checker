##Refactored the initial isbn_checker.rb that I wrote and shortened it by 20 lines.

def isbn_ready(isbn)
	isbn2 = isbn.gsub(/[^0-9xX]/, '').gsub(/x/, 'X')
	if isbn2.length == 10
		if isbn2.include? "X"
			if isbn2[-1] == "X"
				isbn2
			else
				"Invalid ISBN"
			end
		else
			isbn2
		end
	elsif isbn2.length == 13 
		if isbn2.include? "X"
			"Invalid ISBN"
		else
			isbn2
		end
	else
		"Invalid ISBN"
	end
end

def isbn_checksum(isbn)
	isbn2 = isbn_ready(isbn).to_s
	if isbn2 == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn2.length == 10
			checksum_arr = []
			counter = 1
			isbn2.each_char do |num|
				unless counter > 9
					checksum_arr << (num.to_i * counter)
					counter += 1
				end
			end
			checksum_arr.reduce(:+) % 11
		elsif isbn2.length == 13
			checksum_arr = []
			isbn2.chop.each_char.with_index do |num, index|
				if index % 2 == 0
					checksum_arr << (num.to_i * 1)
				else 
					checksum_arr << (num.to_i * 3)
				end
			end
			(10 - (checksum_arr.reduce(:+)) % 10) % 10
		else
		"Invalid ISBN"
		end
	end
end

def isbn_validation(isbn)
	isbn_checker = isbn_checksum(isbn).to_s
	isbn2 = isbn_ready(isbn).to_s
	if isbn_checker == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn2.length == 10
			if isbn_checker == "10" && isbn2[-1] == "x"
				"Valid ISBN10"
			elsif isbn_checker == "10" && isbn2[-1] == "X"
				"Valid ISBN10"
			elsif isbn_checker == isbn2[-1]
				"Valid ISBN10"
			else
				"Invalid ISBN"
			end
		elsif isbn2.length == 13
			if isbn_checker == isbn2[-1]
				"Valid ISBN13"
			else
				"Invalid ISBN"
			end
		else
			"Invalid ISBN"
		end
	end
end