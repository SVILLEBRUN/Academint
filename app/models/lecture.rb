class Lecture < ApplicationRecord
  belongs_to :lesson
  belongs_to :classroom
  has_one :chapter, through: :lesson
  has_one :course, through: :chapter
  enum status: { inactive: 0, démarrée: 1, terminée: 2 }
end
