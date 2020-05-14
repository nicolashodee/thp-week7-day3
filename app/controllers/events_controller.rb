class EventsController < ApplicationController
  # permet de limiter la view aux utilisateurs connectes
  before_action :authenticate_user, only: [:new, :edit]

  #definir une nouvelle instance de la classe event
  def new
    @event = Event.new
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price)
  end

  #creer un event a partir des params
  def create
    @event = Event.new(event_params.merge({admin: current_user}))  
    #si les validates du model event sont ok, on save
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to root_path
    #sinon on affiche une erreur et on redirige sur la page de creation d'event
    else
      flash[:danger] = "Invalid input #{@event.errors.full_messages}"
      render 'new'
    end
  end

  def show
    #affiche tous les events
    @event = Event.find(params[:id])
    #on prevoie d'afficher le nom complet de l'auteur dans la page show
  end

  #creer un array avec les events a venir
  def index
    @events = []
    Event.all.each do |event|
      if event.start_date >= Time.now.strftime("%Y-%m-%d")
        @events << event
      end
    end
  end

  # pour editer un event
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "You successfully edited the event."
      render 'show'
    else
      render 'edit'
    end
  end


  # pour supprimer un event
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:danger] = 'Event deleted'
    redirect_to root_path
  end

  #a partir de la on definit la fonction qui bloque l'acces aux pages secures
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Not logged in."
      redirect_to root_path
    end
  end

end
