class CommsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comm = @post.comms.create(params[:comm].permit(:comm))
		@comm.user_id = current_user.id if current_user
		@comm.save

		if @comm.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:post_id])
		@comm = @post.comms.find(params[:id])
	end

	def update
		@post = Post.find(params[:post_id])
		@comm = @post.comms.find(params[:id])

		if @comm.update(params[:comm].permit(:comm))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comm = @post.comms.find(params[:id])
		@comm.destroy
		redirect_to post_path(@post)
	end
end
