class People::BookmarksController < ApplicationController
  
  def create
    team = Team.find(params[:team_id])
    bookmark = current_person.bookmarks.new(team_id: team.id)
    bookmark.save
    redirect_to team_path(team)
  end
  
  def destroy
    team= Team.find(params[:team_id])
    bookmark = current_person.bookmarks.find_by(team_id: team.id)
    bookmark.destroy
    redirect_to team_path(team)
  end
  
end
