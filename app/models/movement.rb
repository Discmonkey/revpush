class Movement < ActiveRecord::Base
  belongs_to :user
  has_many :active_relationships, class_name:  "Relationship",
           foreign_key: "movement_id",
           dependent:   :destroy
  has_many :members , through: :active_relationships, source: :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :desc, presence: true
  validates :name, presence: true
  validates :zoom, presence: true
  validates :movement_strength, presence: true
  validates :center_lat, presence: true
  validates :center_long, presence: true

end
