class Admin::DepartmentController < Admin::ApplicationController

  load_resource param_method: :params_depart
  load_resource :class=> Department
  authorize_resource
  after_action :get_employees, only: [:create, :update]
  before_action :departments

  def index
    @departments = Department.order(:id)
  end

  def edit
    @department = Department.find(params[:id])
  end

  def create
    @department = Department.create(params_depart)
    if @department.save
      redirect_to admin_department_index_path, notice: "#{@department.name} создан"
    else
      redirect_to admin_department_index_path, notice: 'Отдел не может быть создан, не хватает информации'
    end
  end


  def update
    @department = Department.find(params[:id])
    if params[:department].present?
      respond_to do |format|
        if @department.update_attributes(params_depart)
          format.html { redirect_to(admin_department_index_path, notice: 'Обновлено') }
          format.json { respond_with_bip(@department) }
        else
          format.html { render action: "edit" }
          format.json { respond_with_bip(@department) }
        end
      end
    end
    # if @department.update_attributes(params_depart)
    #   redirect_to admin_department_index_path, notice: "Обновлена информация для #{@department.name}"
    # else
    #   render "edit"
    # end
  end



  def destroy
    department = Department.find(params[:id])
    respond_to do |f|
      if department.destroy.present?
        f.js { render layout: false, content_type: 'text/javascript' }
      else
        f.js {render js: "alert('Ошибка при удалении. За данным отделом закреплены сотрудники')"}
      end
    end
  end

  def departments
    @departments = Department.order(id: :asc)
  end

private

  def params_depart
    params.require(:department).permit!
  end

end
