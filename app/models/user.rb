class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :status
  has_many :roles
  has_one :person
  
  accepts_nested_attributes_for :status
  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :person

  def with_person
    build_person if person.nil?
    self
  end
end
