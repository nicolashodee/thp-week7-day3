class Event < ApplicationRecord

    # un event a plusieurs participants, a travers attendances
    has_many :attendances
    has_many :users, through: :attendances

    # un event a un seul admin
    belongs_to :admin, class_name: "User"

    # checke la presence et renvoie un message si absent ou incorrect
    validates :start_date, presence:  { message: "Please enter a start date" }
    validates :duration, presence:  { message: "Please enter a duration" }
    validates :location, presence:  { message: "Please enter a location" }
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }

end
