class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.search "*"
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
  
  # GET /screencasts
    # GET /screencasts.json
    def index_json
      render json: Post.all
    end

    # GET /screencasts/:id
    # GET /screencasts/:id.json
    def show_json
      render json: Post.find(params[:id])
    end
    
  
  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
  
  
end
