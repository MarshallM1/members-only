class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]

	def new
		@post=Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id=current_user.id
		if @post.save
			flash[:info] = "You have successfully created a new post."
			redirect_to root_url
		else
			render 'new'
		end
	end

	def index
		@posts = Post.all
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end
end
