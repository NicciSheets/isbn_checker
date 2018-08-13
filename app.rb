require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	final_answer = final_answer
	isbn_orig = isbn_orig
	validity_final = validity_final
	erb :checker, locals:{final_answer: final_answer, isbn_orig: isbn_orig, validity_final: validity_final}
end

post '/isbn_checker' do
	puts params
	isbn = params[:isbn] 
	final_answer = isbn_hash(isbn)
	p "final answer is #{final_answer}"
	isbn_orig = final_answer.values[0]
	p "isbn_orig is #{isbn_orig} and its class is #{isbn_orig.class}"
	validity_final = final_answer.values[1]
	p "validity_final is #{validity_final}"
	erb :checker, locals:{final_answer: final_answer, isbn_orig: isbn_orig, validity_final: validity_final}
end