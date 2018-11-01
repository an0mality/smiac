class StatisticsController < ApplicationController
  def index
    @articles = Article.order("created_at DESC").where(tag: 2).publics.paginate(:page => params[:page], :per_page => 10)
  end

  def additionally

  end

end
