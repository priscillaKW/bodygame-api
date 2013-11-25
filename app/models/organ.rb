class Organ
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,            type: String
  field :image_file_name, type: String
  field :stage,           type: Integer

  has_many :studies, autosave: true
  has_many :games,   autosave: true

  validates :name,  presence: true
  validates :stage, presence: true
end
