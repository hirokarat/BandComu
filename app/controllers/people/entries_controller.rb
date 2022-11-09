class People::EntriesController < ApplicationController
  
  
  def create
    team = Team.find(params[:team_id])
    entry = current_person.entries.new(team_id: team.id)
    entry.save
    redirect_to people_team_path(team)
  end
  
  def destroy
    team= Team.find(params[:team_id])
    entry = current_person.entries.find_by(team_id: team.id)
    entry.destroy
    redirect_to people_team_path(team)
  end
  
  def index
    @entries = Entry.where(team_id: current_person.id)
  end
  
end
