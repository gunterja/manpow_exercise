class User < ActiveRecord::Base
  has_one :blog, dependent: :destroy
  has_many :posts, through: :blogs, dependent: :destroy
end
