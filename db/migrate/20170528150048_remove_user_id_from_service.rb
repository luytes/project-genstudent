class RemoveUserIdFromService < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:services, :user, index: true, foreign_key: true)
  end
end
