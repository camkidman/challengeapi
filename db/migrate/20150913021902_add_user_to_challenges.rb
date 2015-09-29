class AddUserToChallenges < ActiveRecord::Migration
  def change
    add_reference :challenges, :user, index: true
    add_foreign_key :challenges, :users
  end
end
