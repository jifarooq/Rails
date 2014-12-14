class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  
  # may need to go back to
  validates :user_id, uniqueness: { scope: :email }
  
  #how to make it so a single user can't have 2 contacts with same email address
  belongs_to :user
  
  has_many :contact_shares#, dependent: :destroy
  #where to put dependent: :destroy?
  
  has_many(
    :shared_users,
    through: :contact_shares,
    source: :user
  )
  #ask about contacts_for_user_id (sql code in solution)
end
