class AddFieldToVideoPlaylist < ActiveRecord::Migration
  def change
    add_reference :video_playlists, :video_stage, index: true, null: false, default: 0
  end
end
