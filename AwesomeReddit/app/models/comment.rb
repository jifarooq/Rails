# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :string(255)      not null
#  post_id           :integer          not null
#  user_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Comment < ActiveRecord::Base
	validates :body, :post, :user, presence: true

	belongs_to :post, inverse_of: :comments
	belongs_to :user, inverse_of: :comments #author

	#LEFT OFF HERE -> NESTED COMMENTS
end
