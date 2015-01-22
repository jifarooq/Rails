# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  post_id      :integer          not null
#  value        :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#  votable_id   :integer          not null
#  votable_type :string(255)      not null
#

class Vote < ActiveRecord::Base
	validates :user, presence: true

	# polymorphic assns: use -two- columns (id, type) 
	# to create -many- associations
	# polymorphic => changeable type
	
	# prevents user from voting twice
	validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

	belongs_to :votable, polymorphic: true
	belongs_to :user, inverse_of: :votes
end
