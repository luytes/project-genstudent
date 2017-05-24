class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :skills
      t.text :description
      t.integer :rating
      t.string :subject
      t.date :year
      t.string :university
      t.string :category
      t.string :degree
      t.integer :cost
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
