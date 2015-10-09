class Comment
	include DataMapper::Resource
	
	property :id		, Serial
	property :content	, Text	, required: true
	
	belongs_to :post
	belongs_to :user
end