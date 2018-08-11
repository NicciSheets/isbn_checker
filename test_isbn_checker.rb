require "minitest/autorun"
require_relative "isbn_checker.rb"

class TestIsbnChecker < Minitest::Test 

	def test_assert_returns_as_string_for_isbn10
		isbn = "0471958697"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "0-321-14653-0"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "877195869x"
		assert_equal(String, isbn10_ready(isbn).class)
		isbn = "877195x869"
		assert_equal(String, isbn10_ready(isbn).class)
	end

	# def test_assert_removes_characters_except_valid_numbers_or_xX
	# 	isbn = "0471958697"
	# 	assert_equal()





end
