class EventsController < ApplicationController
    # permet de limiter la view aux utilisateurs connectes
    before_action :authenticate_user, only: [:new]

    def new
      @event = Event.new
    end
  
    def create
      @random_date = Time.now + 6.days
      @event = Event.new(title: params[:title], location: params[:location], price: params[:price], description: params[:description], start_date: params[:start_date], duration: params[:duration], admin: current_user)  
      if @event.save
        flash[:success] = "Event successfully created"
        render 'show'
      else
        flash[:failure] = "Invalid input #{@event.errors.full_messages}"
        render 'new'
      end
    end
  
    def show
      @event = Event.find(params[:id])
    end
  
    def index
      @events = Event.all
    end
  
    def authenticate_user
      unless current_user
        flash[:danger] = "Not logged in."
        redirect_to root_path
      end
    end

end
