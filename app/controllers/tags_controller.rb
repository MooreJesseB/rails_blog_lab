class TagsController < ApplicationController
	def index
		@tags = Tag.all
		render :index
	end

	def show
		id = params[:id]
		tag = Tag.find_by_id(id)
		@tag = {:tag => tag, :posts => tag.posts}
	end
end