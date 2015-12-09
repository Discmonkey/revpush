class Movement < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :desc, presence: true
  validates :name, presence: true
  validates :zoom, presence: true
  validates :Address, presence: true
  validates :movement_color, presence: true
  validates :movement_strength, presence: true


end
