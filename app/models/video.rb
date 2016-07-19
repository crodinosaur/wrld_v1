class Video < ActiveRecord::Base
  belongs_to :entry
  has_one :event, through: :entry
  has_one :user, through: :entry

  mount_uploader :video_url, VideoUploader
end
