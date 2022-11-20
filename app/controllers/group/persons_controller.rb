class Group::PersonsController < ApplicationController
  def show
    @person=Person.find(params[:id])
  end
  
  def index
    @entries = Entry.where(team_id: current_team.id)
  end
  
  private
  def person_params
    params.require(:person).permit(:last_name)
  end
end
