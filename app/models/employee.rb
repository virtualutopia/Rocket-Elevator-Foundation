class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user
  has_many :batteries
  has_many :interventions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         

end
