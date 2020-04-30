class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_one :payment
  accepts_nested_attributes_for :payment 
  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.capitalize}" if first_name || last_name
    "Anonymous"
  end
end
