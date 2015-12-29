class Admin::PostsController < Admin::ApplicationController
  def new
    @page_title = 'Add Post'
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'Post Created'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(Post_params)
      flash[:notice] = 'Post Updated'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    if @post.update(post_params)
      flash[:notice] = 'Post Deleted'
      redirect_to admin_posts_path
    else
      render 'new'
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :image, :body, :tags)
  end

end
