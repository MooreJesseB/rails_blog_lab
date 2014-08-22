class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = params.require(:post).permit(:title, :author, :body)
    newPost = Post.create(post)
    tagString = params.require(:post).permit(:tags)
    tagArr = []
    tagArr = tagString[:tags].split(',')
    tagArr.each do |tag|
      newTag = Tag.create(name: tag)
      newPost.tags << newTag
    end
    redirect_to "/posts/#{newPost.id}"
  end

  def show
    @post = find_post_by_id
    @comments = @post.comments
  end

  def edit
    @post = find_post_by_id
  end

  def update
    post = find_post_by_id
    post.update_attributes(get_whitewashed_params)
    redirect_to post
  end

  def destroy
    post = find_post_by_id
    post.destroy
    redirect_to '/posts'
  end

  private 

  def find_post_by_id
    Post.find_by_id(params[:id])
  end

  def get_whitewashed_params
    params.require(:post).permit(:title, :author, :body)
  end

end