class ArticleImage < ActiveRecord::Base
	belongs_to :tag
	has_many :articles
end
