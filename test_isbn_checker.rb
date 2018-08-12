require "minitest/autorun"
require_relative "isbn_checker.rb"

class TestIsbnChecker < Minitest::Test 

	def test_assert_removes_chars_except_valid_numbers_or_xX_and_returns_nil_unless_x_last_char_isbn10
		isbn = "0471958697"
		assert_equal("0471958697", isbn10_ready(isbn))
		isbn = "0-321-14653-0"
		assert_equal("0321146530", isbn10_ready(isbn))
		isbn = "877195869x"
		assert_equal("877195869X", isbn10_ready(isbn))
		isbn = "877195x869"
		assert_equal("Invalid ISBN", isbn10_ready(isbn))
	end

	def test_assert_returns_string_class
		isbn = "0471958697"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "0-321-14653-0"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "877195869x"
		assert_equal(String, isbn10_ready(isbn).class)
	end
	
	def test_assert_returns_checksum_isbn10
		isbn = "0471958697"
		assert_equal(7, isbn10_checksum(isbn))
		isbn = "0-321-14653-0"
		assert_equal(0, isbn10_checksum(isbn))
		isbn = "877195869x"
		assert_equal(10, isbn10_checksum(isbn))
	end

	def test_assert_valid_or_invalid_isbn10
		isbn = "0471958697"
		assert_equal("Valid ISBN10", isbn10_validation(isbn))
		isbn = "0-321-14653-0"
		assert_equal("Valid ISBN10", isbn10_validation(isbn))
		isbn = "877195869x"
		assert_equal("Valid ISBN10", isbn10_validation(isbn))	
		isbn = "877195x869"
		assert_equal("Invalid ISBN", isbn10_validation(isbn))
		isbn = "877195a869"
		assert_equal("Invalid ISBN", isbn10_validation(isbn))		
	end	

	def test_assert_removes_chars_except_valid_numbers_for_isbn13
		isbn = "9780470059029"
		assert_equal("9780470059029", isbn13_ready(isbn))
		isbn = "978-0-13-149505-0"
		assert_equal("9780131495050", isbn13_ready(isbn))
		isbn = "978 0 471 48648 0"
		assert_equal("9780471486480", isbn13_ready(isbn))
		isbn = "97804x7148648"
		assert_equal("Invalid ISBN", isbn13_ready(isbn))
		isbn = "978047005902x"
		assert_equal("Invalid ISBN", isbn13_ready(isbn))
	end

	def test_assert_ISBN13_returns_string_class
		isbn = "9780470059029"
		assert_equal(String, isbn13_ready(isbn).class)
		isbn = "978-0-13-149505-0"
		assert_equal(String, isbn13_ready(isbn).class)
		isbn = "978 0 471 48648 0"
		assert_equal(String, isbn13_ready(isbn).class)
	end

end
# def test_assert_isbn10_is_10_characters_else_returns_nil
	# 	isbn = "0471958697"
	# 	assert_equal("0471958697", isbn10_ready(isbn))
	# 	isbn = "0-321-14653-0"
	# 	assert_equal("0321146530", isbn10_ready(isbn))
	# 	isbn = "877195869x"
	# 	assert_equal("877195869X", isbn10_ready(isbn))
	# 	isbn = "471958697"
	# 	assert_nil(nil, isbn10_ready(isbn))
	# 	isbn = "0-21-14653-0"
	# 	assert_nil(nil, isbn10_ready(isbn))
	# 	isbn = "77195869x"
	# 	assert_nil(nil, isbn10_ready(isbn))
	# 	isbn = "77195x869"
	# 	assert_nil(nil, isbn10_ready(isbn))
	# end