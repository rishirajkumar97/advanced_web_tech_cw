class User < ApplicationRecord
  # Include default devise modules. Others available are:
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # TODO: Later add the forgot password and other features
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :lockable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
end
