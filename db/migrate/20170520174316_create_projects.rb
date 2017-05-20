class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :short_description
      t.text :full_description
      t.string :category
      t.string :subcategory
      t.string :pictures
      t.integer :total_budget
      t.date :start_date
      t.date :finish_date

      t.timestamps
    end
  end
end
