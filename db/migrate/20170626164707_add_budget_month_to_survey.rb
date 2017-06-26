class AddBudgetMonthToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :budget_month, :string
  end
end
