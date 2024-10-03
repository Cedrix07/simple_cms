class AdminUser < ApplicationRecord
  
  # hashing password
  has_secure_password
    
  # relation  
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, :through => :section_edits

  #VALIDATIONS
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  FORBIDDEN_USERNAMES = ['littlebeep','humptydumpty','susej']

  #shortcut validations
  validates :first_name, presence: true, length: {maximum:25}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :username, length: { within: 8..25 }, uniqueness: true
  validates :email, presence: true, length: {maximum:100}, :format => EMAIL_REGEX, :confirmation => true 
  
  # custom validation
  validate :user_name_is_allowed
  def user_name_is_allowed
    if FORBIDDEN_USERNAMES.include?(username)
      errors.add(:username, "has been restricted from use")
    end
  end

  #named scope
  scope :sorted, lambda{order('admin_users.last_name, admin_users.first_name ASC')}

  def name 
    "#{first_name} #{last_name}"
  end
end
