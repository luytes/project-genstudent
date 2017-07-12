class CreateEnquires < ActiveRecord::Migration[5.0]
  def change
    create_table :enquires do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.string :phone_number
      t.text :message
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
