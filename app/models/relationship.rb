class Relationship < ActiveRecord::Base
  belongs_to :member, class_name: "User"
  belongs_to :movement, class_name: "Movement"
  validates :member_id, presence: true
  validates :movement_id, presence: true
end
