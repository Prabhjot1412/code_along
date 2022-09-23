# frozen_string_literal: true

# true
class UserController < ApplicationController
  def index
    # @pagy,@user = pagy(User).order(email: :asc)
    @q = User.order(email: :asc).ransack(params[:q])
    @pagy, @user = pagy(@q.result(distinct: true))
  end

  def show
    @user = User.find(params[:id])
  end
end
