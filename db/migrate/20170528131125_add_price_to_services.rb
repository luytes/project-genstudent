class AddPriceToServices < ActiveRecord::Migration[5.0]
  def change
    add_monetize :services, :price, currency: { present: true }
  end
end
