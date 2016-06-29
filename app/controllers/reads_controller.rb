class ReadsController < ApplicationController
	before_action :find_read, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]
	def index
		if params[:category].blank?
			@reads = Read.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
			@reads = Read.where(:category_id => @category_id).order("created_at DESC")
		end
	end
	def new
		@read = current_user.reads.build
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end

	def create
		@read = current_user.reads.build(read_params)
		@read.category_id = params[:category_id]
		if @read.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id]}
	end
	

	def update
		@read.category_id = params[:category_id]

		if @read.update(read_params)
			redirect_to read_path(@read)
		else	
			render 'edit'
		end
	end

	def destroy
		@read.destroy
		redirect_to root_path
	end

	def show
		if @read.reviews.blank?
			@average_review = 0
		else
			@average_review = @read.reviews.average(:rating).round(2)
		end
	end


	private
	def read_params
		params.require(:read).permit(:title, :description, :writer, :category_id, :read_img)
	end
	def find_read
		@read = Read.find(params[:id])
	end
end
