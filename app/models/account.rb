class Account < ApplicationRecord
  belongs_to :accountable, polymorphic: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  ACCOUNT_TYPES=["Buyer", "Seller"]
  attr_accessor :type
end
