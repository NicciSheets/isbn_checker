

def isbn_ready(isbn)
	""
	isbn2 = isbn.gsub(/[^0-9xX]/,'').gsub(/x/,'X')
	if isbn2.include? "X" 
		if true && isbn2[-1] == "X"
			isbn2
		else 
			nil
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









#isbn = "0471958697"
#isbn = "0-321-14653-0"
#isbn = "877195869x"
#isbn = "877195x869"

#p isbn10_ready(isbn)
