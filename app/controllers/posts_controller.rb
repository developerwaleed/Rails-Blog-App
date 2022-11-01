class PostsController < ApplicationController
  def index
    @user = User.includes(posts: %i[comments author]).find(params[:user_id].to_i)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    newpost = Post.new
    respond_to do |format|
      format.html { render :new, locals: { newpost: } }
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0

    respond_to do |format|
      format.html do
        if @post.save
          @post.update_posts_counter
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post.id)
        else
          newpost = Post.new
          flash.now[:error] = 'Error: post could not be saved'
          render :new, locals: { newpost: }
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
