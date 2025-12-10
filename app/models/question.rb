class Question < ApplicationRecord
  belongs_to :lesson
  has_many :options, dependent: :destroy
  validates :body, presence: true
end
