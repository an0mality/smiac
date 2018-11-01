class Admin::RmiController < Admin::ApplicationController
  
  # load_and_authorize_resource 
  before_filter :check_user
  def theme
    @themes = FaqRmisTheme.order(:name)
  end

  def create
    rec = FaqRmisTheme.create(theme_params)
    if rec.save
      notice = 'Запись добавлена'
    else
      notice = 'Запись не добавлена'
    end
    redirect_to theme_admin_rmi_index_path, notice: notice
  end

  def edit_theme
    @rec = FaqRmisTheme.find(params[:id])
    respond_to do |format|
      if @rec.update_attributes(theme_params)
        format.html { redirect_to theme_admin_rmi_index_path }
        format.json { respond_with_bip(@rec) }
      else
        format.html { render :action => "theme" }
        format.json { respond_with_bip(@rec) }
      end
    end

  end

  def destroy_theme
    @rec = FaqRmisTheme.find(params[:id])
    unless @rec.nil?
      if params[:act].present?
        ActiveRecord::Base.transaction do
          FaqRmisAnswer.destroy_all(faq_rmis_theme_id: @rec.id)
          @rec.destroy

        end
        notice =  'Тема и вопросы к ней удалены'
      else
        @rec.destroy
        notice =  'Тема удалена'

      end

      redirect_to theme_admin_rmi_index_path, notice: notice
    end


  end

  def answer
    @answer = FaqRmisAnswer.new
    @answers = FaqRmisAnswer.all
    @themes = FaqRmisTheme.order(:name)
  end

  def create_answer
    rec = FaqRmisAnswer.create(answer_params)
    if rec.save
      notice = 'Запись добавлена'
    else
      notice = 'Запись не добавлена'
    end
    redirect_to answer_admin_rmi_index_path, notice: notice
  end

  def destroy_answer
    FaqRmisAnswer.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to answer_admin_rmi_index_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  def edit_answer
    @answer = FaqRmisAnswer.find(params[:id])
  end

  def update_answer
    @answer = FaqRmisAnswer.find(params[:id])
    @answer.update_attributes(answer_params)
    redirect_to edit_answer_admin_rmi_path(params[:id]), notice: 'Запись обновлена'
  end

  private
  def theme_params
    params.require(:faq_rmis_theme).permit!
  end

  def answer_params
    params.require(:faq_rmis_answer).permit!
  end

  def check_user    
    redirect_to admin_main_index_path, alert: 'Доступ ограничен' if cannot? :manage, FaqRmisTheme

  end
  


end
