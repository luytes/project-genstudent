class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :category
      t.text :description
      t.float :longitude
      t.float :latitude
      t.string :address
      t.string :short_description

      t.timestamps
    end
  end
end
