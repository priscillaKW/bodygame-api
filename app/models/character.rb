class Character
  include Mongoid::Document
  include Mongoid::Timestamps

  KINDS = %w(male female)

  field :kind, type: String
  field :current_stage, type: Integer

  embedded_in :user

  validates :kind, presence: true, inclusion: { in: KINDS }
end
