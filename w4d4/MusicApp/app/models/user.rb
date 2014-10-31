# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	attr_reader :password

	validates :email, :password_digest, :session_token, presence: true
	validates :email, uniqueness: true
	before_validation :ensure_session_token

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def is_password?(password)
		#had create and new backwards before!
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def reset_session_token!
		self.session_token = User.generate_session_token
		self.save!
		self.session_token
	end

	protected

		#need to rewrite as class method
		def self.generate_session_token
			SecureRandom.urlsafe_base64
		end

		def ensure_session_token
			#need to say User and not self here
			self.session_token ||= User.generate_session_token
		end

		def self.find_by_credentials(email, password)
			@user = User.find_by_email(email)

			return nil if @user.nil?

			@user.is_password?(password) ? @user : nil
		end

end
