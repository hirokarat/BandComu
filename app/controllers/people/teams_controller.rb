class People::TeamsController < ApplicationController
  
  def index
    @teams=Team.all.page(params[:page]).per(10)
    if params[:area].present?
      @teams = @teams.get_by_area params[:area]
    elsif params[:genre].present?
      @teams = @teams.get_by_genre params[:genre]
    elsif params[:area].present? && params[:genre].present?
      @teams=@teams.get_by_area params[:area]
      @teams=@teams.get_by_genre params[:genre]
    end
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
