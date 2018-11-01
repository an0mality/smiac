class VideoFile < ActiveRecord::Base
  belongs_to :video_playlist
  validates :video_id,  presence: true
  validates :video_playlist_id,  presence: true
  # searchkick


  def self.search params
    VideoFile.where('lower(description) like lower (?) or lower(title) like lower (?)' , "%#{params[:search]}%", "%#{params[:search]}%").order('created_at desc')
  end
end
