# frozen_string_literal: true

# true
class UserController < ApplicationController
  def index
    @pagy,@user = pagy(User.all.order(email: :asc))
  end

  def show
    @user = User.find(params[:id])
  end
end
