class AddRatingToReviewsAndRemoveRatingFromServices < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :rating, :integer
    add_column :reviews, :rating, :integer
  end
end
