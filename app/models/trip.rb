class Trip < ApplicationRecord
    belongs_to :driver, class_name: 'User'
    has_many :reservations, dependent: :destroy
    has_many :passengers, through: :reservations, source: :user
  
    validates :departure_location, presence: true
    validates :arrival_location, presence: true
    validates :departure_time, presence: true
    validates :seats_available, numericality: { greater_than: 0 }
  
    # Ajoutez d'autres validations ou méthodes au besoin
  end
  