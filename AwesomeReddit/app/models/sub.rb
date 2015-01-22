# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  description  :text
#  moderator_id :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Sub < ActiveRecord::Base
  validates :title, :moderator_id, presence: true
  
  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :moderator_id,
    primary_key: :id
  )
  
  has_many :post_subs, inverse_of: :sub, dependent: :destroy
  has_many :posts, through: :post_subs, source: :post

  has_many :votes, as: :votable, class_name: 'Vote'
  
end