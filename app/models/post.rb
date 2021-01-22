class Post < ApplicationRecord
	 has_many :comments, dependent: :destroy
	 belongs_to :category
	 belongs_to :user
	 validates :category_id, :author, presence: true
	 validates :subject, presence: true, length: { in: 6..25 }

	 def get_comments
	 	self.comments
	 end

	 def total_comments
	 	self.comments.count
	 end

end
