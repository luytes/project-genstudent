class ChangingBudgetFromIntegerToString < ActiveRecord::Migration[5.0]
  def change
    remove_column :surveys, :budget, :integer
    add_column :surveys, :budget, :string
  end
end
