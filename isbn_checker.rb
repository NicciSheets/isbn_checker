

def isbn_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9xX]/,'').gsub(/x/,'X')
	if isbn2.include? "X" 
		if true && isbn2.length == 10 && isbn2[-1] == "X"
			isbn2
		else 
			"Invalid ISBN"
		end
	else
		isbn2
	end
end
# 	if isbn2.length != 10
# 		nil
# 	else 
# 		isbn2
# 	end
# end

def isbn10_checksum(isbn)
	isbn2 = isbn_ready(isbn)
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


# def isbn10_validation(isbn)
# 	if isbn10_validation == 10 && isbn[-1]
# 		"Valid ISBN10"
# 	elsif isbn10 validation == isbn[-1]
# 		"Valid ISBN10"
# 	else
# 		"Invalid ISBN"
# 	end
# end





#isbn = "0471958697"
#isbn = "0-321-14653-0"
#isbn = "877195869x"
#isbn = "877195x869"

#p isbn10_ready(isbn)
#p isbn10_checksum(isbn)