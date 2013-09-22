class Study
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content,     type: String
  field :content_url, type: String

  belongs_to :organ

  validates :content,  presence: true
end
