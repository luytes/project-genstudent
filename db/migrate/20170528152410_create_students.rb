class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :introduction
      t.string :university
      t.string :degree
      t.string :subject
      t.integer :year

      t.timestamps
    end
  end
end
