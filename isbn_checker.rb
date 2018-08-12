def isbn10_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9xX]/,'').gsub(/x/,'X')
	if isbn2.length != 10
		"Invalid ISBN"
	else
		if isbn2.include? "X" 
			if true && isbn2[-1] == "X"
				isbn2
			elsif true && isbn2[1] != "X"
				"Invalid ISBN"
			else
				"Invalid ISBN"
			end
		else
			isbn2
		end
	end
end

def isbn10_checksum(isbn)
	isbn2 = isbn10_ready(isbn)
	if isbn2 == "Invalid ISBN"
		"Invalid ISBN"
	else
		checksum_arr = []
		counter = 1
		isbn2.each_char do |num|
			unless counter > 9
				checksum_arr << (num.to_i * counter)
				counter += 1
			end
		end
		checksum_arr.reduce(:+) % 11
	end
end

def isbn10_validation(isbn)
	isbn10_checker = isbn10_checksum(isbn)
	if isbn10_checker == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn10_checker == 10 && isbn[-1] == "X" || "x"
			"Valid ISBN10"
		elsif isbn10_checker == isbn[-1]
			"Valid ISBN10"
		else
			"Invalid ISBN"
		end
	end
end

def isbn13_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9]/,'')
	if isbn2.length == 13
		isbn2
	else
		"Invalid ISBN"
	end
end

def isbn13_checksum(isbn)
	isbn2 = isbn13_ready(isbn)
	if isbn2 == "Invalid ISBN"
		"Invalid ISBN"
	else
		checksum_arr = []
		isbn2.chop.each_char.with_index do |num, index|
			if index % 2 == 0
				checksum_arr  << (num.to_i * 1)
			else
				checksum_arr << (num.to_i * 3)
			end
		end
		(10 - (checksum_arr.reduce(:+)) % 10) % 10
	end 
end

def isbn13_validation(isbn)
	isbn13_checker = isbn13_checksum(isbn)
	if isbn13_checker == "Invalid ISBN"
		"Invalid ISBN"
	else
		if isbn13_checker.to_s == isbn[-1]
			"Valid ISBN13"
		else
			"Invalid ISBN"
		end
	end
end

def which_one(isbn)
	if isbn10_validation(isbn) == "Valid ISBN10"
		"Valid ISBN10"
	else 
		if isbn13_validation(isbn) == "Valid ISBN13"
			"Valid ISBN13"
		else
			"Invalid ISBN"
		end
	end
end


	



#isbn = "0471958697"
#isbn = "0-321-14653-0"
#isbn = "877195869x"
#isbn = "877195x869"
#isbn = "877195z869"

#p isbn.gsub(/[^0-9xX]/, '')

#isbn_ready(isbn)
#p isbn10_checksum(isbn)
#p isbn10_validation(isbn)

#isbn = "978047005902x"
#isbn = "97804x7148648"
#isbn = "9780470059029"
#isbn = "978-0-13-149505-0"

#p isbn.gsub(/[^0-9]/,'')
#p isbn13_checksum(isbn)
#p isbn[-1]
#p isbn13_validation(isbn)