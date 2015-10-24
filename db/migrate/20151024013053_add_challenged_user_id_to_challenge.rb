class AddChallengedUserIdToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :challenged_user_id, :integer
  end
end
