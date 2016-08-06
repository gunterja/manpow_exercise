class User < ActiveRecord::Base
  has_one :blog, dependent: :destroy
end
