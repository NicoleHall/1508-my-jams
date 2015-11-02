class Song < ActiveRecord::Base
  validates_presence_of :title, :artist

  # validates :title, presence: true
  # validates :artist, presence: true

  def to_param
    "here-is-my-title"
  end
end
