require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	final_answer = final_answer
	isbn = isbn
	erb :checker, locals:{final_answer: final_answer, isbn: isbn}
end

post '/isbn_checker' do
	puts params
	isbn = params[:isbn_check].split("\r\n")
	p "#{isbn} and #{isbn.class} and #{isbn.length}"
	final_answer = []
	isbn.each do |isbn|
		final_answer << which_one(isbn)
	end
	final_answer
	erb :checker, locals:{final_answer: final_answer, isbn: isbn}
end
	
