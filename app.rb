require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	final_answer = [] 
	isbn = []
	big_array = big_array
	erb :checker, locals:{final_answer: [""], isbn: [""], big_array: [""]}
end

post '/isbn_checker' do
	isbn = params[:isbn_check].split("\r\n")
	final_answer = []
	isbn.each do |isbn|
		final_answer << which_one(isbn)
	end
	final_answer
	a = isbn
	b = final_answer
	big_array = a.zip(b)
	erb :checker, locals:{final_answer: final_answer, isbn: isbn, big_array: big_array}
end
	
