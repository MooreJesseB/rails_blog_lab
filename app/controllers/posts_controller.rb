class PostsController < ApplicationController
  def index
    @posts = []
    Post.all.each do |post|
      @posts.push ({:post => post, :tags => post.tags})
    end
    render :index
  end

  def new
    render :new
  end

  def show
    id = params[:id]
    post = Post.find_by_id(id)
    @post = {:post => post, :tags => post.tags}
  end

  def create
    post = params.require(:post).permit(:title, :author, :body)
    tagString = params.require(:post).permit(:tags)
    puts tagString
    tagArr = []
    
    newPost = Post.create(post)
    
    tagArr = tagString[:tags].split(' ')
    tagArr.each do |tag|
      newTag = Tag.create(name: tag)
      newPost.tags << newTag
    end
    redirect_to '/'
  end
end