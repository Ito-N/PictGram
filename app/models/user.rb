class User < ApplicationRecord
  
  validates :name, presence: true, length: {maximum: 15}
  validates :email, presence: true, format: {with: /\A[a-zA-Z\d\._-]+@[a-zA-Z\d_-]+\.([a-zA-Z\d._-]+)+\z/}
  validates :password, length: {in: 8..32}, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
  has_many :comments
end
