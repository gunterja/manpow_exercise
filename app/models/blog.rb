class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged

  belongs_to :user, :class_name => User, :foreign_key => :owner
  has_many :posts
end
