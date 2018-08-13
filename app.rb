require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	puts params
	final_answer = final_answer
	isbn_orig = isbn_orig
	validity_final = validity_final
	erb :checker, locals:{final_answer: final_answer, isbn_orig: isbn_orig, validity_final: validity_final}
end

post '/isbn_checker' do
	puts params
	final_answer = isbn_hash(params[:isbn])
	p "final answer is #{final_answer}"
	isbn_orig = final_answer.values[0]
	p "isbn_orig is #{isbn_orig}"
	validity_final = final_answer.values[1]
	p "validity_final is #{validity_final}"
	erb :checker, locals:{final_answer: final_answer, isbn_orig: isbn_orig, validity_final: validity_final}
end