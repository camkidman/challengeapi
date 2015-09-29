class AddAttributesToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :title, :string
    add_column :challenges, :description, :string
  end
end
