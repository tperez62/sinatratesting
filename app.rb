require 'data_mapper'
require 'sinatra'
require 'logger'

DataMapper.setup :default, "sqlite3://#{Dir.pwd}/sinatratesting.db"
DataMapper.auto_upgrade!

get '/' do
	"Hello"
end