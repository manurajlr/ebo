class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :designation
  belongs_to :role
	validates :email,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
	validates :login,uniqueness: true
	#validates :password, confirmation: true,length: 6..20
   validates :work_phone,format: { with: /\A(180[-]?)?\d{3}[-]?\d{3}[-]?\d{4}\z/}
    #validate :join_date_check_with_dob
end

  def join_date_check_with_dob
    errors.add(:date_of_joining, "should always be greater than your Date of birth") if
      !date_of_joining.blank? and date_of_joining < date_of_birth
  end