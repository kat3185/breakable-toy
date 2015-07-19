class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    if current_user && current_user.admin?
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        flash[:notice] = "Post created!"
        redirect_to posts_path
      else
        flash[:notice] = @post.errors.full_messages
        render :new
      end
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def index
    @posts = Post.all.order("created_at DESC").limit(3)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if current_user && current_user.admin?
      @post = Post.find(params[:id])
      @post.update(post_params)
      if @post.save
        flash[:notice] = "Good news: You fixed that post!"
        redirect_to root_path
      else
        flash[:notice] = @course.errors.full_messages
        render :edit
      end
    else
      redirect_to "http://www.reddit.com"
    end
  end

  def destroy
    if current_user && current_user.admin?
      @post = Post.find(params[:id])
      if @post.destroy
        flash[:notice] = "That post was poorly written."
      else
        flash[:notice] = "I'm sorry Dave, I can't do that."
      end
      redirect_to root_path
    else
      redirect_to "http://www.reddit.com"
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
