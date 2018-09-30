class Case < ApplicationRecord
  has_many :face_video_analysis, -> { order(:created_at => :desc) }
end
