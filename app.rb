require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	final_answer = final_answer
	isbn = isbn
	# validity_final = validity_final
	# isbn_orig = isbn_orig
	erb :checker, locals:{final_answer: final_answer, isbn: isbn}
end

post '/isbn_checker' do
	puts params
	isbn = params[:isbn_check]
	# isbn_arr = []
	# isbn = isbn.split('\r\n')
	p "#{isbn} and #{isbn.class} and #{isbn.length}"
	final_answer = []
	isbn.split("\r\n").each do
		p isbn.split("\r\n")
		final_answer << which_one(isbn)
	end
	p final_answer
	erb :checker, locals:{final_answer: final_answer, isbn: isbn}
end
	# final_answer["#{isbn}" => "#{validity}"]
	# isbn_orig = final_answer.values
	# validity_final = final_answer.values

	# # final_answer = isbn_hash(isbn)
	# #p "final answer is #{final_answer}"
	# isbn_orig = final_answer.values[0]
	# p "isbn_orig is #{isbn_orig} and its class is #{isbn_orig.class}"
	# validity_final = final_answer.values[1]
	# p "validity_final is #{validity_final}"
	
