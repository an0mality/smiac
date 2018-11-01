class Admin::ArticlesController < Admin::ApplicationController
  
  # before_filter :check_user 
  # def check_user    
  #   redirect_to admin_main_index_path, alert: 'Доступ ограничен' if cannot? :manage, Article
  # end

  load_and_authorize_resource class: Article


  def index
    @articles = Article.order(created_at: :desc).paginate(per_page:5, page:params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    if params[:tag_id].present?
      params[:article][:article_image_id]=Article.get_image_id params[:tag_id] 
      @article = Article.create(article_params)
      notice='Новость создана'
    else
      notice='Новость не создана. Заполните все поля. Поле тема обязательна к заполнению'
    end
    redirect_to :back, notice: notice
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to :back, notice: 'Новость удалена'
  end

  def update
    article = Article.find(params[:id])
    params[:article][:article_image_id]=Article.get_image_id params[:tag_id] if params[:tag_id].present?
    respond_to do |format|
      if article.update_attributes(article_params)
        format.html { redirect_to :back, notice: 'Новость обновлена' }
        format.json { respond_with_bip(article) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(article) }
      end
    end
  end



  private
    def article_params
      params.require(:article).permit!
    end
end
