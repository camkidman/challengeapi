class AddCompleteToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :complete, :boolean, :default => false
  end
end
