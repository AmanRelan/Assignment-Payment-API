class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates_presence_of :first_name
  validates_presence_of :last_name
end
