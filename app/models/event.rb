class Event < ApplicationRecord

    # un event a plusieurs participants, a travers attendances
    has_many :attendances
    has_many :users, through: :attendances

    belongs_to :admin, class_name: "User"

    # checke la presence et renvoie un message si absent ou incorrect
    validates :start_date, presence: true
    validate :start_must_be_future

    validates :duration, presence: true

    validates :location, presence: true
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 50 }


    def start_must_be_future
        return unless start_date 
        errors.add(:start_date, "ne doit pas être passée") unless start_date > Time.now
    end

    def end_date
        start_date + (duration * 60)
    end

end
