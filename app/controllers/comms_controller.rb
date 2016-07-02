class CommsController < ApplicationController
	
	before_action :authenticate_user!	

	before_action :find_post

	def new
		@comm = @post.comms.new
	end

	def create
		@comm = @post.comms.new(comm_params)
		@comm.user_id = current_user.id if current_user
		if @comm.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		@comm = @post.comms.find(params[:id])
	end

	def update
		@comm = @post.comms.find(params[:id])

		if @comm.update(comm_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@comm = @post.comms.find(params[:id])
		@comm.destroy
		redirect_to post_path(@post)
	end

	def find_post
		@post = Post.find(params[:post_id])
	end

	def comm_params
    	params.require(:comm).permit(:comm)
  	end
end
