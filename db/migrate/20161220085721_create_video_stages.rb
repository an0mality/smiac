class CreateVideoStages < ActiveRecord::Migration
  def change
    create_table :video_stages do |t|
      t.string :name, null: false
      t.integer :parent_id
    end
  end
end
