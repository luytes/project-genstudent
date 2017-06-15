class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :category
      t.string :subcategory
      t.string :title
      t.text :description
      t.integer :budget
      t.string :presence
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
