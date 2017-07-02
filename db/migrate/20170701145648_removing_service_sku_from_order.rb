class RemovingServiceSkuFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :service_sku, :string
    remove_column :services, :sku, :string
  end
end
