class AttendancesController < ApplicationController

    before_action :authenticate_user!
	before_action :event_admin_cannot_attend_as_participant, only: [:new, :create]
	before_action :user_cannot_subscribe_if_already_participating, only: [:new, :create]
    before_action :current_user_is_admin, only: [:index]
    
    def index
        @event = Event.find(params[:event_id])
    end

    def new
        @event = Event.find(params[:event_id])
        @attendance = Attendance.new
    end

    def create
        @event = Event.find(params[:event_id])
        @amount = @event.price
        @attendance = Attendance.new(event: @event, user: current_user)

        customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
        })

        charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
        })

        if @attendance.save
            @attendance.update(stripe_customer_id: customer.id)
            flash[:success] = "Super ! Tu es inscrit à l'évènement !"
            redirect_to event_path(@event)
        else
            render 'new'
        end

        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
        end
    end

    

    private

    def current_user_is_participant?
        event = Event.find(params[:event_id])
        !Attendance.where(event: event,user: current_user).empty?
    end
  
    def event_admin_cannot_attend_as_participant
        # Redirige vers l'accueil si on est l'admin
        if current_user == Event.find(params[:event_id]).admin
            # Ne peut pas accéder au formulaire d'inscription de son propre évènement
        redirect_to root_path
        end
    end
  
    def user_cannot_subscribe_if_already_participating
        # Renvoie vrai si on est un nouveau participant
        if current_user_is_participant?
         redirect_to root_path
        end
    end
  
    def current_user_is_admin
      # Redirige vers l'accueil si on est pas l'admin
      unless current_user == Event.find(params[:event_id]).admin
        # Ne peut pas accéder au formulaire d'inscription de son propre évènement
        redirect_to root_path
    end

end
