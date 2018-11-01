class CreateVideoPlaylists < ActiveRecord::Migration
  def change
    create_table :video_playlists do |t|
      t.string :playlist_id, null: false
      t.text :title

    end
  end
end
