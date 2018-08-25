require 'sinatra'
require 'aws-sdk'
# require 'csv'
require 'json'
require_relative 'isbn_checker_refactor.rb'
# require_relative 'local_env.rb'
enable :sessions

# load 'local_env.rb' if File.exist?('local_env.rb')

# s3 = Aws::S3::Client.new(profile: 'NicciSheets', region: 'us-east-2')

# s3.put_object(bucket: 'isbn-bucket81', key: "csv_file.csv")


get '/' do
	final_answer = final_answer
	isbn = isbn
	big_array = big_array
	erb :checker, locals:{big_array: [""], final_answer: [""], isbn: [""]}
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
	erb :checker, locals:{big_array: big_array, final_answer: final_answer, isbn: isbn}
end
	
