##Test for the newly refactored isbn_checker that I initially had, shortened by 20 lines.

require "minitest/autorun"
require_relative "isbn_checker_refactor.rb"

class TestIsbnChecker < Minitest::Test 

	def test_assert_removes_chars_except_valid_numbers_or_xX_and_returns_nil_unless_x_last_char_isbn10
		isbn = "0471958697"
		assert_equal("0471958697", isbn_ready(isbn))
		isbn = "0-321-14653-0"
		assert_equal("0321146530", isbn_ready(isbn))
		isbn = "877195869x"
		assert_equal("877195869X", isbn_ready(isbn))
		isbn = "877195x869"
		assert_equal("Invalid ISBN", isbn_ready(isbn))
		isbn = "9780470059029"
		assert_equal("9780470059029", isbn_ready(isbn))
		isbn = "978-0-13-149505-0"
		assert_equal("9780131495050", isbn_ready(isbn))
		isbn = "978 0 471 48648 0"
		assert_equal("9780471486480", isbn_ready(isbn))
		isbn = "97804x7148648"
		assert_equal("Invalid ISBN", isbn_ready(isbn))
		isbn = "978047005902x"
		assert_equal("Invalid ISBN", isbn_ready(isbn))
	end

	def test_assert_ISBN_returns_string_class
		isbn = "9780470059029"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "978-0-13-149505-0"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "978 0 471 48648 0"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "0471958697"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "0-321-14653-0"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "877195869x"
		assert_equal(String, isbn_ready(isbn).class)
	end		

	def test_assert_returns_checksum_isbn
		isbn = "0471958697"
		assert_equal(7, isbn_checksum(isbn))
		isbn = "0-321-14653-0"
		assert_equal(0, isbn_checksum(isbn))
		isbn = "877195869x"
		assert_equal(10, isbn_checksum(isbn))
		isbn = "9780470059029"
		assert_equal(9, isbn_checksum(isbn))
		isbn = "978-0-13-149505-0"
		assert_equal(0, isbn_checksum(isbn))
		isbn = "978 0 471 48648 0"
		assert_equal(0, isbn_checksum(isbn))
		isbn = "97804x7148648"		
		assert_equal("Invalid ISBN", isbn_checksum(isbn))
	end

	def test_assert_valid_or_invalid_isbn
		isbn = "0471958697"
		assert_equal("Valid ISBN10", isbn_validation(isbn))
		isbn = "0-321-14653-0"
		assert_equal("Valid ISBN10", isbn_validation(isbn))
		isbn = "877195869x"
		assert_equal("Valid ISBN10", isbn_validation(isbn))	
		isbn = "877195x869"
		assert_equal("Invalid ISBN", isbn_validation(isbn))
		isbn = "877195a869"
		assert_equal("Invalid ISBN", isbn_validation(isbn))		
		isbn = "9780470059029"
		assert_equal("Valid ISBN13", isbn_validation(isbn))
		isbn = "978-0-13-149505-0"
		assert_equal("Valid ISBN13", isbn_validation(isbn))
		isbn = "978 0 471 48648 0"
		assert_equal("Valid ISBN13", isbn_validation(isbn))
		isbn = "97804x7148648"		
		assert_equal("Invalid ISBN", isbn_validation(isbn))
		isbn = "9780470059022"
		assert_equal("Invalid ISBN", isbn_validation(isbn))
		isbn = "97804a0059029"
		assert_equal("Invalid ISBN", isbn_validation(isbn))
	end

end
