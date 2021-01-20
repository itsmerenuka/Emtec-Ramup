class Category < ApplicationRecord
	has_many :posts

	def get_category_posts
		self.posts
	end
end
