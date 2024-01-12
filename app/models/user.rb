class User < ApplicationRecord
    has_many :trips, foreign_key: 'driver_id', class_name: 'Trip', dependent: :destroy
    has_many :reservations, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { in: %w(driver passenger) }
  
    # has_secure_password
  
    def driver?
      role == 'driver'
    end
  
    def passenger?
      role == 'passenger'
    end
  end
  
