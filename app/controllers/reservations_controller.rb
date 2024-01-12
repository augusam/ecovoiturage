class ReservationsController < ApplicationController
    # before_action :authenticate_user!

    def new
      @reservation = Reservation.new
      # ... autres logiques nécessaires
      @trip = Trip.find(params[:trip_id])
    end

    def create
      @reservation = current_user.reservations.build(reservation_params)
      if @reservation.save
        # Rediriger vers la page de confirmation de réservation ou autre action appropriée
        redirect_to new_reservations_path(@trip)
        #<%= link_to "Réserver ce Trajet", new_trip_reservation_path(@trip) %>

      else
        # Gestion des erreurs de validation
      end
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:trip_id, :seat_count)
    end

  end

end
  