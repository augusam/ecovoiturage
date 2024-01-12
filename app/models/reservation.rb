class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :trip


  enum status: { pending: 'En attente', confirmed: 'Confirmée', canceled: 'Annulée' }
  validates :seat_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, presence: true, inclusion: { in: statuses.keys }

  # Méthodes
  def confirm_reservation
    update(status: 'Confirmée')
    # Ajoutez ici la logique supplémentaire si nécessaire
  end

  def cancel_reservation
    update(status: 'Annulée')
    # Ajoutez ici la logique supplémentaire si nécessaire
  end
end
