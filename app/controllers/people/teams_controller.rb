class People::TeamsController < ApplicationController
  
  def index
    @teams=Team.all.page(params[:page]).per(10)
    @area = Team.group(:area).pluck(:area).sort
  end
  
  def search
    @teams = Team.where('area LIKE ?', "%#{params[:area]}%")
    @area = Team.group(:area).pluck(:area).sort
    render :index
  end
  
  def show
    @team=Team.find(params[:id])
  end
  
  
  private
  def team_params
    params.require(:team).permit(:area)
  end
  
  
end
