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

get '/users' do
	logger.debug("Displaying User Page")
	"User Page"
end

get '/users/:id' do
	logger.debug("Sending User Display Page")
	@title = 'User Display Page'
	erb :userdisplay
end