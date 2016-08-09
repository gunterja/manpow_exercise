class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Blog was successfully created.' }
        format.js {}
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.js { render :action => "new" }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:blog_name, :custom_url)
    end
end
