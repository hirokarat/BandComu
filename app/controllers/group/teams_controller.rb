class Group::TeamsController < ApplicationController
   
  def index
    @teams = Team.all
    if params[:area].present?
      @teams = @teams.get_by_area params[:area]
    elsif params[:genre].present?
       @teams = @teams.get_by_genre params[:genre]
    elsif params[:area].present? && params[:genre].present?
      @teams=@teams.get_by_area_genre params[:area][:genre]
    end
  end
  
  
  
  def show
    @team = current_team
  end

  
  private

  def team_params
    params.require(:team).permit(:name,:email,:area,:genre,:count,:age)
  end
  
  
end
