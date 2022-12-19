class Group::PersonsController < ApplicationController
  before_action :authenticate_team!
  
  def show
    @person=Person.find(params[:id])
  end
  
  def index
    @entries = Entry.where(team_id: current_team.id).page(params[:page]).per(10)
  end
  
  private
  def person_params
    params.require(:person).permit(:last_name)
  end
end
