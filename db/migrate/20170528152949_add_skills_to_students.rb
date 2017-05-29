class AddSkillsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :skills, :string
  end
end
