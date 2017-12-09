class Api::V1::PostsController < ApplicationController
	
	# shows all of the posts
	def index
		@posts = Post.all
		render json: @posts, status: 200
	end

	# shows one post 
	def show
		@post = Post.find(params[:id]) 
		render json: @post, status: 200
	end

	# saves new post to database
	def create
		#byebug
		@post = Post.new(post_params)
  		@post.save
  		render json: @post, status: 200
	end

	# initializes a new edit of a post
	def edit
		@post = Post.find(params[:id])
	end

	# saves update to database
	def update
		@post = Post.find(params[:id])
 
	    if @post.update(post_params)
	      redirect_to @post
	    else
	      render 'edit'
	    end
	end


	# deletes post
	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
    	render json: @posts, status: 200
	end

	private
	  def post_params
	    params.require(:post).permit(:title, :body)
	  end

end
