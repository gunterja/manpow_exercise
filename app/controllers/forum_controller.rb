class ForumController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
