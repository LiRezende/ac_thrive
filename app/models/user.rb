class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :status, optional: true
  has_and_belongs_to_many :roles, :join_table => :users_roles
  has_one :person
  has_one :adress, :through => :person
  has_one :document, :through => :person
  has_many :schedules, :through => :person
  has_one :student, :through => :person
  
  accepts_nested_attributes_for :status
  accepts_nested_attributes_for :person

  def with_person
    build_person if person.nil?
    self
  end

  after_create :send_password
  def password_required?
    return false if new_record?
    super
  end

  def send_password
    pass = SecureRandom.base64(12) + '&0_W)q$3'
    update(password: pass)
    UserMailer.send_password(self, pass).deliver_now
  end

  validate :password_complexity

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
