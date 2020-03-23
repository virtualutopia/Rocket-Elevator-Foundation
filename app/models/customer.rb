
class Customer < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :address

  has_many :buildings

end