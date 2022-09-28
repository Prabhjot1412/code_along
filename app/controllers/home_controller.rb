# frozen_string_literal: true

# Be sure to restart your server when you modify this file.
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[landing_page privacy terms]
  def landing_page; end

  def privacy; end

  def terms; end

  def premium; end

  def charge
    check = true
    if !params[:cvv].match(/\d{3}/)
      flash[:alert]="invalid cvv"
      check = false
    elsif !params[:card_number].match(/\d{16}/)
      flash[:alert]="invalid card number"
      check = false
    elsif !params[:exp].match(/\d\d\/\d{2}/)
      flash[:alert]='invalid expiry date'
      check = false
    end
    if check
      exp_ar=params[:exp].split('/')
      params[:exp_month]= exp_ar[0]
      params[:exp_year]= exp_ar[1]
      s = StripeService.new
      token = s.create_stripe_token(params)
      customer = s.find_or_create_stripe_user(current_user)
      s.create_card(customer.id,token.id)
      s.create_charge(customer, 2000)
      current_user.change_user_to_paid
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path, alert: "some error occured"
    end
  end
end
