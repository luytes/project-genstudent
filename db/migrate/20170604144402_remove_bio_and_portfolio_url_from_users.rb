class RemoveBioAndPortfolioUrlFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :bio, :text
    remove_column :users, :portfolio_url, :string
  end
end
