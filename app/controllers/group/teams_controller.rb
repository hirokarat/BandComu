class Group::TeamsController < ApplicationController
   before_action :set_q, only: [:index, :search]

  def index
    @teams = Team.page(params[:page]).per(10)
    @area = params[:area]
  end
  
  def show
    @team = current_team
  end
  
  def search
    @results = @q.result
  end

  
  private

  def team_params
    params.require(:team).permit(:name,:email,:area,:genre,:count,:age)
  end
  
  def set_q
    @q = Team.ransack(params[:q])
  end
  
end
