class Case < ApplicationRecord
  attr_accessor :enabled
  has_many :face_video_analysis, -> { order(:created_at => :desc) }
end
