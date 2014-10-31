class UsersController < ApplicationController

	# def index

	# end

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			log_in!(@user)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

end
