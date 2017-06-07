class AddServiceIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :service, foreign_key: true
  end
end
