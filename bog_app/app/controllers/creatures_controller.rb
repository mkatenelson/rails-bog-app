class CreaturesController < ApplicationController

  #INDEX
  def index
    @creatures = Creature.all
    render :index
  end

  #NEW
  #show the new creature form
  def new
    @creature = Creature.new
    render :new
  end

  #CREATE
  #create a new creature in the db
  def create
    #creates variable for creature's params
    creature_params = params.require(:creature).permit(:name, :description)

    #creates new creature from 'creature_params'
    creature = Creature.new(creature_params)

    #if creature saves, redirdct to route that displays all creatures
    #ONLY the newly created creature
    if creature.save
      redirect_to creature_path(creature) #creature_path is same as "/creatures/#{creature.id}"
    end
  end

  #SHOW
  #show a specific creature
  def show
    #get creature id from the url params and save to variable
    creature_id = params[:id]

    #use 'creature_id' to find the creature in the db and save to instance variable
    @creature = Creature.find_by_id(creature_id)

    #render the show view (it has access to the instance variable)
    render :show
  end

end
