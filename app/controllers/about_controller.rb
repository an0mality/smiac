class AboutController < ApplicationController
  def tasks

  end


  def contacts

  end

  def departments
    @cabinets = Department.order(:id)
    params[:department_id] = params[:department_id].blank? ? @cabinets.first.id : params[:department_id]
    @department = Department.find(params[:department_id])
    @employees = Employee.where(department_id: params[:department_id])
  end

  def phones
    @cabinets = Department.order(:id)
    @phones = Employee.order('boss DESC, surname ASC')
  end

  def vacancies
    @vacancies = Vacancy.actual
  end

end
