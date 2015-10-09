class User
	include DataMapper::Resource
	
	property :id		, Serial
	property :email		, String	, required: true	, unique: true
	property :username	, String	, required: true	, unique: true
	property :password	, String	, required: true
end