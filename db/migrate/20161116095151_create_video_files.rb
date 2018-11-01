class CreateVideoFiles < ActiveRecord::Migration
  def change
    create_table :video_files do |t|
      t.string :video_id, null: false
      t.text :description
      t.belongs_to :video_playlist, null: false
      t.text :title

      t.timestamp :created_at, null: false
    end
  end
end
