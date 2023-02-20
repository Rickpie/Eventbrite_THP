class Attendance < ApplicationRecord
  after_create :attendance_email

  def attendance_email
    AttendanceMailer.attendance_email(self).deliver_now
  end

  belongs_to :user
  belongs_to :event
end
