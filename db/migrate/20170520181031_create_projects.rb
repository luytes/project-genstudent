class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :full_description
      t.string :category
      t.string :subcategory
      t.date :start_date
      t.date :finish_date
      t.string :short_description
      t.string :picture
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
