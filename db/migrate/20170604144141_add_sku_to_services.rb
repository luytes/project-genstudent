class AddSkuToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :sku, :string
  end
end
