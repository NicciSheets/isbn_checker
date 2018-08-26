require 'sinatra'
require 'aws-sdk'
require 'csv'
require 'json'
require_relative 'isbn_checker_refactor.rb'
require_relative 'local_env.rb'
enable :sessions

load 'local_env.rb' if File.exist?('local_env.rb')

s3 = Aws::S3::Client.new(:access_key_id => ENV["S3_KEY"],
 :secret_access_key => ENV["S3_SECRET"]
  )


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
	


	# *** Below are sample ISBN numbers to use in textarea, the first 6 are valid and the last 6 are invalid
# 0471958697
# 0-321-14653-0
# 877195869x
# 9780470059029
# 978-0-13-149505-0
# 978 0 471 48648 0
# -
# 877195x869
# 877195a869
# 97804x7148648
# 9780470059022
# 97804a0059029