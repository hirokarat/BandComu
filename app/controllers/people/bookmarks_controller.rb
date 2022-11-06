class People::BookmarksController < ApplicationController
  
  def create
    team = Team.find(params[:team_id])
    bookmark = current_person.bookmarks.new(team_id: team.id)
    bookmark.save
    redirect_to people_team_path(team)
  end
  
  def destroy
    team= Team.find(params[:team_id])
    bookmark = current_person.bookmarks.find_by(team_id: team.id)
    bookmark.destroy
    redirect_to people_team_path(team)
  end
  
  def index
    @bookmarks = Bookmark.where(team_id: current_person.id)
  end
  
end
