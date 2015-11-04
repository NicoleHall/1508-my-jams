class Song < ActiveRecord::Base
  validates_presence_of :title, :artist

  validates :title, presence: true
  validates :artist, presence: true
  belongs_to :user

end
