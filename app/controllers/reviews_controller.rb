class ReviewsController < ApplicationController
	before_action :find_read
	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.read_id= @read.id 
		@review.user_id = current_user&.id

		if @review.save
			redirect_to read_path(@read)
		else
			render 'new'
		end
	end

	def edit
	end
	def destroy
		@review.destroy
		redirect_to read_path(@read)
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to read_path(@read)
		else 
			render 'edit'
		end
	end

	private
	def review_params
		params.require(:review).permit(:rating, :comment)
	end
	def find_read
		@read = Read.find(params[:read_id])
	end
	def find_review
		@review = Review.find(params[:id])
	end

end
