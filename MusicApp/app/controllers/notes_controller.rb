class NotesController < ApplicationController
	def new
	end

	def create
		@note = Note.new(note_params)
		@note.user_id = current_user.id
		@note.save
		redirect_to track_url(@note.track_id)
	end

	def destroy
		@note = Note.find(params[:id])
		@note.destroy
		redirect_to track_url(@note.track_id)
	end

	private

		def note_params
			#beware that hidden inputs in form also need to be permitted
			#track_id needs to be both here AND notes form partial!
			params.require(:note).permit(:body, :track_id)
		end

end
