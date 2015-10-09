require 'data_mapper'
require 'sinatra'
require 'logger'
require 'require_all'
require_all './models'

logger = Logger.new('sinatra_testing_log.log')

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/sinatratesting.db"
DataMapper.auto_upgrade!

get '/' do
	"Home page"
end

get '/newuser' do
	@title = 'New User Page'
	erb :newuser
end

post '/newuser' do
	logger.debug("Creating a new user")
	@user = User.new
	@user.email = params[:email]
	@user.username = params[:username]
	logger.debug("Saving new user to DB")
	@user.save
	redirect '/'
end

get '/users' do
	logger.debug("Displaying User Page")
	"User Page"
end

get '/users/:id' do
	logger.debug("Sending Response for User id: #{params[:id]}")
	if User.get(params[:id]).nil? then redirect 'not_found' end
	@title = 'User Display Page'
	erb :userdisplay
end

get '/users/:id/posts' do
	@title = 'Display All User Posts'
	erb :displayallposts
end

get '/users/:userid/posts/:postid' do
	logger.debug("Sending Response for Post id: #{params[:postid]}")
	if Post.get(params[:postid]).nil? then redirect 'not_found' end
	@title = 'Post Display Page'
	erb :displaypost
end

not_found do 
	"not found"
end