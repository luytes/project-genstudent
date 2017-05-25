class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :category
      t.integer :rating
      t.date :start_date
      t.date :finish_date
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :picture
      t.text :what_i_will_do_for_you
      t.text :what_i_need_from_you
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
