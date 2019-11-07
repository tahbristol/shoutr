class CreateShouts < ActiveRecord::Migration[6.0]
  def change
    create_table :shouts do |t|
      t.string :body, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
