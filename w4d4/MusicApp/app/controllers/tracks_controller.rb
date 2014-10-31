class TracksController < ApplicationController
	before_action :require_login!
	
	def new
		@track = Track.new
		render :new
	end

	def create
		@track = Track.new(track_params)

		if @track.save
			redirect_to track_url(@track)
		else
			render :new
		end
	end

	def edit
		@track = Track.find(params[:id])
		render :edit
	end

	def update
		@track = Track.find(params[:id])

		if @track.update(track_params)
			# fail
			redirect_to track_url(@track)
		else
			render :edit
		end
	end

	def show
		@track = Track.find(params[:id])
		render :show
	end

	def destroy
		@track = Track.find(params[:id])
		album_id = @track.album_id

		@track.destroy
		redirect_to album_url(album_id)
	end

	private

	def track_params
		#needed to add lyrics
		params.require(:track).permit(:track_name, :album_id, :kind, :lyrics)
	end
end
