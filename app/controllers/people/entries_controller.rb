class People::EntriesController < ApplicationController
  before_action :authenticate_person!
  
  def create
    team = Team.find(params[:team_id])
    entry = team.entries.new(person_id: current_person.id)
    entry.save!
    redirect_to people_team_path(team)
  end
  
  def destroy
    team= Team.find(params[:team_id])
    entry = team.entries.find_by(person_id: current_person.id)
    entry.destroy if entry.present?
    redirect_to people_team_path(team)
  end
end
