class Admin::VacanciesController < Admin::ApplicationController
  
  load_resource param_method: :params_vac
  load_resource :class=> Vacancy
  authorize_resource

  def index
    @vacancies=Vacancy.order(created_at: :desc)
  end

  def edit
    @vacancy= Vacancy.find(params[:id])
    if params[:vacancy].present?
      respond_to do |format|
      if @vacancy.update_attributes(params_vac)
        format.html { redirect_to(@vacancy, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@vacancy) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@vacancy) }
      end
    end
  end


  def create_vacancy
    @vacancy = Vacancy.create(params_vac)
    if @vacancy.save
      redirect_to :back, notice: 'Вакансия создана'
    else
      redirect_to :back, notice: 'Вакансия не создана'
    end
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    if @vacancy.update_attributes(params_vac)
      redirect_to admin_vacancies_path, notice: "Обновлено"
    else
      render "edit"
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    if @vacancy.destroy
      redirect_to admin_vacancies_path, notice: 'Вакансия удалена'
    end
  end

private

  def params_vac
    params.require(:vacancy).permit!
  end

end
