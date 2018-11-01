class RmiController < ApplicationController
  def index
    @themes = FaqRmisTheme.order(:name)

    @q = FaqRmisAnswer.ransack(params[:q])
    @answers = @q.result.all

  end
end
