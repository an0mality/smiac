class VideoPlaylist < ActiveRecord::Base
  validates :playlist_id, presence: true
  has_many :video_files

  def self.medstat
    VideoPlaylist.where("title like '%статис%'").first.id
  end
end
