class CreateStudentapplications < ActiveRecord::Migration[5.0]
  def change
    create_table :studentapplications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :sex
      t.string :country
      t.string :city
      t.string :university
      t.string :major
      t.string :skills
      t.string :picture
      t.string :cv

      t.timestamps
    end
  end
end
