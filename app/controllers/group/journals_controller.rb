class Group::JournalsController < ApplicationController

  before_action :authenticate_team!

  def new
    @journal=Journal.new
  end

  def create
    @journal=Journal.new(journal_params)
    @journal.team_id=current_team.id
    # 受け取った値を,で区切って配列にする
    tag_list=params[:journal][:name].split(',')
    if @journal.save
       @journal.save_journals(tag_list)
      redirect_to group_journals_path,notice:'投稿完了しました'
    else
      flash.now[:alert] = '投稿に失敗しました'
      render 'new'
    end
  end

  def index
    @journals = Journal.page(params[:page]).per(10)
    @tag_lists=Tag.all
    if params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      @journals = @tag.journals.order(created_at: :desc).page(params[:page]).per(10)
    else
      @journals = Journal.all.order(created_at: :desc).page(params[:page]).per(10)
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    #検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @journals=@tag.journals.page(params[:page]).per(10)
  end


  def destroy
    journal = Journal.find(params[:id])
    journal.destroy
    redirect_to group_journals_path
  end

  def show
    @journal = Journal.find(params[:id])
    @journal_tags = @journal.tags
  end

  def user_index
    @team= Team.find(params[:id])
    @journals = Journal.where(team_id:params[:id]).order("created_at DESC").page(params[:page]).per(10)
  end

  private
  def journal_params
    params.require(:journal).permit(:journal,:activity_image)
  end
end
