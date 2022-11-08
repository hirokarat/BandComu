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
    @team = Team.find(params[:id])
  end

  def edit
    @team = current_team
  end

  def update
    @team = current_team
    if @team.update(team_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to group_team_path(current_team)
    else
      render :edit
    end
  end
  
  
  private

  def team_params
    params.require(:team).permit(:name,:email,:area,:genre,:count)
  end
  
  
end
