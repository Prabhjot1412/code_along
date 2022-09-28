# frozen_string_literal: true

require 'stripe'
# creating a service for stripe payment gateway
class StripeService
  def find_or_create_stripe_user(user)
    if user.stripe_customer_id.present?
      Stripe::Customer.retrieve(user.stripe_customer_id)
    else
      Stripe::Customer.create({
                                name: user.username,
                                email: user.email
                              })
    end
  end

  def create_stripe_token(params)
    Stripe::Token.create({
    card: {
    number: params[:card_number],
    exp_month: params[:exp_month],
    exp_year: params[:exp_year],
    cvc: params[:cvc]
    }
  })
  end

  def create_card(customer_id,token_id)
    Stripe::Customer.create_source(
    customer_id,
    {source: token_id}
  )
  end

  def create_charge(customer,price)
    Stripe::Charge.create({
    amount: price,
    currency: 'usd',
    source: customer.default_source,
    customer: customer.id,
    description: 'My First Test Charge (created for API docs at https://www.stripe.com/docs/api)',
    })
  end
end
