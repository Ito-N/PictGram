class Comment < ApplicationRecord
  validates :content, presence: true, length: {maximum: 40}
  
  belongs_to :topic
  belongs_to :user
end
