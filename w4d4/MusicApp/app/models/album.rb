# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  kind       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_name :string           not null
#

class Album < ActiveRecord::Base
	validates :band_id, :kind, :album_name, presence: true

	belongs_to :band
	has_many :tracks, dependent: :destroy

end
