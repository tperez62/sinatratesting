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
	if @user.save 
		redirect '/'
	else
		"This email or username is already taken."
	end
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

get '/users/:id/newpost' do
	@title = 'New Post Page'
	erb :newpost
end

post '/users/:id/newpost' do
	@user = User.get(params[:id])
	@post = Post.new
	@post.title = params[:title]
	@post.content = params[:content]
	@post.user = @user
	@post.save
	redirect "/users/#{@user.id}"
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