class AddPictureToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :student_picture, :string
  end
end
