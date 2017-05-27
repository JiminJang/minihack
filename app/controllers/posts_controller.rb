class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show, :gate]
 before_action :find_posts, only: [:show, :edit, :update, :destroy, :recommend]
  def index
  	@posts = Post.all.order("upcount DESC")
  end

  def show
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		render 'new'
  	end  	
  	
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render 'edit'
  	end
  end

    def destroy
  	@post.destroy
  	redirect_to posts_path
    end
    
    def recommend
    post = Post.find(params[:id])
        post.upcount += 1
        
        if post.save
          redirect_to @post
        end
    end
    
  private

  def post_params
  params.require(:post).permit(
    :title, 
    :description, 
    :image)
end

  def find_posts  	
  	@post = Post.find(params[:id])
  end
  
  
end