class People::JournalsController < ApplicationController
  
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

  def show
    @journal = Journal.find(params[:id])
    @journal_tags = @journal.tags
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    #検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @journals=@tag.journals.page(params[:page]).per(10)
  end
  
  def user_index
    @team= Team.find(params[:id])
    @journals = Journal.where(team_id:params[:id]).order("created_at DESC").page(params[:page]).per(10)
  end


end
