# frozen_string_literal: true

# adding omniauth fields to user
class AddOmniauthFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :image, :string
    add_column :users, :provider, :string
  end
end
