class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy # Orders created by the user
  has_many :order_items, through: :orders # Order items created by the user
	enum :role, [ :user, :agent, :admin ]
end
