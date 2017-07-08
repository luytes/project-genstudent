class AddSubscriptionIdToCustomer < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :subscription, :string
  end
end
