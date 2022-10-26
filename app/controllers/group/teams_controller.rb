class Group::TeamsController < ApplicationController
  
  def index
    @teams=Team.all
  end
  
  def show
    @team = current_team
  end
  
  private

  def team_params
    params.require(:team).permit(:name,:email)
  end
  
end
