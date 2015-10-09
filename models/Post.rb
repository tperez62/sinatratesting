class Post
	include DataMapper::Resource
	
	property :id		, Serial
	property :title		, Text	, required: true
	property :content	, Text
	
	belongs_to :user
	has n, :comments
end