class CommentsController < ApplicationController
  def index
    @post = find_post
    @coments = @post.comments.all
  end

  def show
    @post = find_post
    @comment = find_comments
  end

  def new
    @post = find_post
    @comment = @post.comments.new
  end

  def edit
    @post = find_post
    @comment = find_comments
  end

  def create
    @post = find_post
    @comment = @post.comments.new(comment_params)
    if @comment.save 
      redirect_to [@post, @comment]
      # redirect_to [@post, @comment]
    else
      render action: 'new'
    end
  end

  def update
    @post = find_post
    @comment = @post.comments.find_by_id(params[:id])
    if @comment.update(comment_params)
      redirect_to [@post, @comment]
    else
      render action: 'edit'
    end
  end

  def destroy
    @post = find_post
    @child = find_comments
    @child.destroy
    redirect_to post_comments_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body)
  end

  def find_post
    Post.find_by_id(params[:post_id])
  end

  def find_comments
    @post.comments.find_by_id(params[:id])
  end

end