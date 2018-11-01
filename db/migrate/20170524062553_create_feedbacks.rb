class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :email
      t.string :fio
      t.string :department
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
