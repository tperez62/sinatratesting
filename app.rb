require 'data_mapper'
require 'sinatra'
require 'logger'
require './models/User'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/sinatratesting.db"
DataMapper.auto_upgrade!

get '/' do
	"Home page"
end

get '/users' do
	"User Page"
end

get '/users/:id' do
	@title = 'User Display Page'
	erb :userdisplay
end