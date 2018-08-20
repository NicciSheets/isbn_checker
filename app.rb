require 'sinatra'
require 'aws-sdk'
require 'csv'
require 'json'
require_relative 'isbn_checker_refactor.rb'
enable :sessions

# load 'local_ENV.rb' if File.exist?('local_ENV.rb')

# s3 = Aws::S3::Client.new(profile: 'm.m.default.2018', region: 'us-east-2')

# s3.put_object(bucket: 'sand.castle', body: validated, key: "valid_check#{count}.csv")


get '/' do
	big_array = big_array
	erb :checker, locals:{big_array: [""]}
end

post '/isbn_checker' do
	isbn = params[:isbn_check].split("\r\n").map(&:strip)
	p"isbn params are #{params[:isbn_check]} and isbn is #{isbn}"
	final_answer = []
	isbn.each do |isbn|
		final_answer << isbn_validation(isbn)
	end
	final_answer
	a = isbn
	b = final_answer
	big_array = a.zip(b)
	erb :checker, locals:{big_array: big_array}
end
	
