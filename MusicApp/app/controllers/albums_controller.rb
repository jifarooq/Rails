class AlbumsController < ApplicationController
	before_action :require_login!
	
	def new
		@album = Album.new
		render :new_album
	end

	def create
		@album = Album.new(album_params)

		if @album.save
			redirect_to album_url(@album)
		else
			render :new_album
		end
	end

	def edit
		@album = Album.find(params[:id])
		render :edit_album
	end

	def update
		@album = Album.find(params[:id])

		if @album.update(album_params)
			redirect_to album_url(@album)
		else
			render :edit_album
		end
	end

	def show
		@album = Album.find(params[:id])
		render :show_album
	end

	def destroy
		@album = Album.find(params[:id])
		band_id = @album.band_id

		@album.destroy
		redirect_to band_url(band_id)
	end

	private

	def album_params
		params.require(:album).permit(:album_name, :band_id, :kind)
	end
end
