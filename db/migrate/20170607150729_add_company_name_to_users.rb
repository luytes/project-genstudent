class AddCompanyNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_name, :string
    add_column :users, :company_description, :text
    remove_column :users, :skills, :string
  end
end
