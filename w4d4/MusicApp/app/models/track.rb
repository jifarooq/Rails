# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  kind       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_name :string           not null
#  lyrics     :text
#

class Track < ActiveRecord::Base
	validates :album_id, :track_name, :kind, presence: true

	belongs_to :album
	has_one :band, through: :album
	has_many :notes
	
end
