class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email, null: false, default: ""
      t.text :text
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
