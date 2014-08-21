class Post < ActiveRecord::Base
	has_many :post_tag_links
	has_many :tags, :through => :post_tag_links
end
