# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 github]
  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    user ||= User.create(name: access_token.info.name,
                         email: access_token.info.email,
                         password: Devise.friendly_token[0, 20],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         image: access_token.info.image)
    user
  end

  def username
    if name?
      name
    else
      email
    end
  end
end
