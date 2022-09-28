# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable
  devise :invitable, :database_authenticatable, :registerable, :trackable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[google_oauth2 github]
  has_many :posts, dependent: :destroy

  enum :membership, %i[free paid], default: 0
  # User must have a stripe customer id when created
  after_create do
    customer = Stripe::Customer.create(email: email)
    update(stripe_customer_id: customer.id)
    puts("stripe_customer_id created: #{stripe_customer_id}")
  end

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first
    user ||= User.create(name: access_token.info.name,
                         email: access_token.info.email,
                         password: Devise.friendly_token[0, 20],
                         provider: access_token.provider,
                         uid: access_token.uid,
                         image: access_token.info.image
                         )
    user.skip_confirmation!
    user
  end

  def username
    if name?
      name
    else
      email.split('@').first
    end
  end

  def change_user_to_paid
    update(membership: 1)
  end
end
