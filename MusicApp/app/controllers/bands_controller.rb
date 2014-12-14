class BandsController < ApplicationController
	before_action :require_login!

	def index
		@bands = Band.all
		render :index_band
	end

	def new
		@band = Band.new
		render :new_band
	end

	def create
		@band = Band.new(band_params)

		if @band.save
			# fail
			redirect_to band_url(@band)
		else
			render :new_band
		end
	end

	def edit
		@band = Band.find(params[:id])
		render :edit_band
	end

	def update
		@band = Band.find(params[:id])

		if @band.update(band_params)
			redirect_to band_url(@band)
		else
			render :edit_band
		end
	end

	def show
		@band = Band.find(params[:id])
		render :show_band
	end

	def destroy
		@band = Band.find(params[:id])
		@band.destroy
		redirect_to bands_url
	end

	private

	def band_params
		params.require(:band).permit(:name)
	end

end
