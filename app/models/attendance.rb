class Attendance < ApplicationRecord
    after_create :attendance_send
    belongs_to :user
    belongs_to :event
   
end
