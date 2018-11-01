class Admin::EmployeesController < Admin::ApplicationController

  load_resource param_method: :params_employee
  load_resource :class=> Employee 
  authorize_resource

  after_action :get_employees, only: [:create, :update]
  
  def index
    @cabinets = Department.order(:id)
    @phones = Employee.order('boss DESC, surname ASC')

    @em =Department.joins(:employees)
  end

  def new
    @phone = Employee.new
  end

  def edit
    @phone = Employee.find(params[:id])
    if params[:employee].present?
      respond_to do |format|
        if @phone.update_attributes(params_employee)
          format.html { redirect_to(:back, notice: 'Обновлено') }
          format.json { respond_with_bip(@phone) }
        else
          format.html { render action: "edit" }
          format.json { respond_with_bip(@phone) }
        end
      end
    end
  end

  def create
    @phone = Employee.create(params_employee)
    if @phone.save
      redirect_to :back, notice: "Вы добавили сотрудника #{@phone.surname}"
    else
      redirect_to :back, notice: 'Сотрудник не может быть добавлен, возможно не заполнены поля'
    end
  end

  def update
    @phone = Employee.find(params[:id])
    if @phone.update_attributes(params_employee)

      redirect_to :back, notice: "Обновлены данные для сотрудника #{@phone.surname}"
    else
      redirect_to :back, notice: 'Данные не могут быть обновлены'
    end
  end

  def destroy
    @phone = Employee.find(params[:id])
    @phone.destroy
    redirect_to :back
  end



private

  def params_employee
    params.require(:employee).permit!
  end
end
