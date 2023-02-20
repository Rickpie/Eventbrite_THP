class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past, on: [:create, :update]

  def start_date_cannot_be_in_the_past
      if start_date.present? && start_date < Time.zone.now
        errors.add(:start_date, "can't be in the past")
      end
  end

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :duration_multiple_of_five

  private

 def duration_multiple_of_five
  errors.add(:duration, "must be a multiple of 5") unless duration.nil? || duration % 5 == 0
end


  validates  :title, presence: true, length: {minimum:5, maximum:140}
  validates :description, presence: true, length: {minimum:20, maximum:1000}
  validates :price, presence: true, length: {minimum:1, maximum:1000}
  validates :location, presence: true
  has_many :participations
  has_many :users, through: :participations
end