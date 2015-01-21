# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  url        :string(255)
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title, :author, presence: true
    
  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub

  has_many :comments, inverse_of: :post
  
  def parent_comments
    comments.where(parent_comment_id: nil)
  end
end
