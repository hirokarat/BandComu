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
  
  def show
    @team=Team.find(params[:id])
  end
  
  def bookmarks
    @bookmarks = current_person.bookmarks.page(params[:page]).per(10)
  end
  
  def entries
    @entries = current_person.entries.page(params[:page]).per(10)
  end
  
  
  private
  def team_params
    params.require(:team).permit(:area,:header_image,:profile_image)
  end
  
  
end
