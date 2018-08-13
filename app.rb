require 'sinatra'
require_relative 'isbn_checker.rb'
enable :sessions

get '/' do
	erb :checker
end

post '/isbn_checker' do
	puts params
	validity = which_one(params[:isbn])
	p "validity is #{validity}"
	erb :checker, locals:{validity: validity}
end
