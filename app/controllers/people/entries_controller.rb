class People::EntriesController < ApplicationController
  
  
  def create
    @team = Team.find(params[:team_id])
    entry = @team.entries.new(person_id: current_person.id)
    entry.save!
    redirect_to people_team_path(@team)
  end
  
  def destroy
    @team= Team.find(params[:team_id])
    entry = @team.entries.find_by(person_id: current_person.id)
    if entry.present?
        entry.destroy
        redirect_to people_team_path(@team)
    else
        redirect_to people_team_path(@team)
    end
  end
  
end
