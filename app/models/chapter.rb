class Chapter < ApplicationRecord
  belongs_to :course
  has_many :lessons, dependent: :destroy
  validates :name, :description, presence: true
end
