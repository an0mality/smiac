class ArticlesController < ApplicationController
  layout :resolve_layout
  def index
    if params[:search].present?
      @articles = Article.paginate(page: params[:page], per_page: 6).search(params)
    else
      @articles = Article.published.paginate(page: params[:page], per_page: 6)
    end
  end

  def show
    @article = Article.find(params[:id])
    @title = @article.title
    if @article.present?
      @article.update_attributes(count_views: @article.count_views+1)    
    end
    redirect_to root_path unless @article.show


  end

  def feed    
    @articles = Article.published.order(created_at: :desc).paginate(page: params[:page], per_page: 6)
  end

  
  private
    def resolve_layout
      case action_name
      when "feed"
        false
      else
        "application"
      end
    end


  



end
