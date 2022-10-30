class Group::JournalsController < ApplicationController
  
  def new
    @journal=Journal.new
  end
  
  def create
    @journal=Journal.new(journal_params)
    @journal.team_id=current_team.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:journal][:name].split(',')
    if @journal.save
       @journal.save_tag(tag_list)
      redirect_to group_journals_path(@journal),notice:'投稿完了しました:)'
    else
      render new
    end
  end
  
  def index
    @journals = Journal.page(params[:page]).per(10)
    @tag_list=Tag.all
  end
  
  def index_team
    @journals = Journal.where(team_id:params[:id])
  end
  
  def destroy
    
  end
  
  def show
    @journal = Journal.find(params[:id])
    @journal_comment=JournalComment.new
    @journal_tags = @journal.tags
  end
  
  def edit
    @journal = Journal.find(params[:id])
    @tag_list=@journal.tags.pluck(:name).join(',')
  end
  
  def update
    @journal = Journal.find(params[:id])
    tag_list=params[:journal][:name].split(',')
    if @journal.update(journal_params)
       @journal.save_tag(tag_list)
       redirect_to journal_path(@journal.id),notice:'投稿完了しました:)'
    else
      render:edit
    end
  end
  
  private
  def journal_params
    params.require(:journal).permit(:journal, :activity_image)  
  end
  
  
end
