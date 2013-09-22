class Organ
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,            type: String
  field :image_file_name, type: String

  has_many :studies, autosave: true
  has_many :games

  validates :name, presence: true
end
