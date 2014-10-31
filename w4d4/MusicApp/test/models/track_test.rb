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
#  lyrics     :string
#

require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
