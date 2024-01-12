class TripsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
      @trips = Trip.all
    end

    def new
        @trip = current_user.trips.build
      end
    
      def create
        @trip = current_user.trips.build(trip_params)
        if @trip.save
          # Rediriger vers la page du trajet créé ou autre action appropriée
        else
          render :new
        end
      end
    
      private
    
      def trip_params
        params.require(:trip).permit(:departure_location, :destination, :departure_time, :available_seats)
      end
    end 

  end
  