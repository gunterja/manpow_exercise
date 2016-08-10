class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :blog, dependent: :destroy
  has_many :posts, through: :blogs, dependent: :destroy

  # Method to return a user's full name if needed
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
