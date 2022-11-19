class People::BookmarksController < ApplicationController

  def create
    @team = Team.find(params[:team_id])
    bookmark = @team.bookmarks.new(person_id: current_person.id)
    bookmark.save
    redirect_to people_team_path(@team)
  end

  def destroy
    @team= Team.find(params[:team_id])
    bookmark = @team.bookmarks.find_by(person_id: current_person.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to people_team_path(@team)
    else
        redirect_to people_team_path(@team)
    end
  end

end
