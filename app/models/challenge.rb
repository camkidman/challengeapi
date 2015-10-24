class Challenge < ActiveRecord::Base
  belongs_to :user

  def challengee
    User.find(challenged_user_id)
  end

  def challenger
    user
  end
end
