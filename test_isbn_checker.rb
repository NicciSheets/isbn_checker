require "minitest/autorun"
require_relative "isbn_checker.rb"

class TestIsbnChecker < Minitest::Test 

	def test_assert_removes_chars_except_valid_numbers_or_xX_and_returns_nil_unless_x_last_char_isbn10
		isbn = "0471958697"
		assert_equal("0471958697", isbn_ready(isbn))
		isbn = "0-321-14653-0"
		assert_equal("0321146530", isbn_ready(isbn))
		isbn = "877195869x"
		assert_equal("877195869X", isbn_ready(isbn))
		isbn = "877195x869"
		assert_nil(nil, isbn_ready(isbn))
	end

	def test_assert_it_is_a_string
		isbn = "0471958697"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "0-321-14653-0"
		assert_equal(String, isbn_ready(isbn).class)
		isbn = "877195869x"
		assert_equal(String, isbn_ready(isbn).class)
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

	# def test_assert_removes_chars_except_valid_numbers_for_isbn13
	# 	isbn = "9780470059029"
	# 	assert_equal("9780470059029", isbn_ready(isbn))
	# 	isbn = "978-0-13-149505-0"
	# 	assert_equal("9780131495050", isbn_ready(isbn))
	# 	isbn = "978 0 471 48648 0"
	# 	assert_

	# end

end
