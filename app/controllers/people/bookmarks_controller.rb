class People::BookmarksController < ApplicationController

  before_action :authenticate_person!

  def create
    team = Team.find(params[:team_id])
    bookmark = team.bookmarks.new(person_id: current_person.id)
    bookmark.save
    redirect_to people_team_path(team)
  end

  def destroy
    team= Team.find(params[:team_id])
    bookmark = team.bookmarks.find_by(person_id: current_person.id)
    bookmark.destroy if bookmark.present?
    redirect_to people_team_path(team)
  end
end
