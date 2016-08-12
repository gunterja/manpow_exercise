class BlogsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def my_posts
    
  end

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.friendly.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.owner = current_user.id

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

  def destroy
    @blog = Blog.friendly.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.js {}
      format.json { head :no_content }
    end
  end

  private

    def blog_params
      params.require(:blog).permit(:blog_name, :slug)
    end
end
