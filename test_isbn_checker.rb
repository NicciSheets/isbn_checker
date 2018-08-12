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
		assert_equal(nil, isbn10_ready(isbn))
		isbn = "0471958697"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "0-321-14653-0"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "877195869x"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "877195x869"
		assert_equal(NilClass, isbn10_ready(isbn).class)
	end




end
