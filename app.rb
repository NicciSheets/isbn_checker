require 'sinatra'
require 'aws-sdk'
require 'csv'
require 'json'
require_relative 'isbn_checker.rb'
require_relative 'csv_checker.rb'
enable :sessions

get '/' do
	final_answer = [] 
	isbn = []
	big_array = big_array
	erb :checker, locals:{final_answer: [""], isbn: [""], big_array: [""]}
end

post '/isbn_checker' do
	isbn = params[:isbn_check].split("\r\n").map(&:strip)
	p"isbn params are #{params[:isbn_check]} and isbn is #{isbn}"
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
	
