# frozen_string_literal: true

# true
class UserController < ApplicationController
  def index
    Pagy::DEFAULT[:items] = 10
    # @pagy,@user = pagy(User).order(email: :asc)
    @q = User.ransack(params[:q])
    @pagy, @user = pagy(@q.result(distinct: true))
  end

  def show
    @user = User.find(params[:id])
  end
end
