class Admin::ApplicationController < ApplicationController
  layout "admin"

	# load_and_authorize_resource 
  # :class=>Admin::ApplicationController
  # before_filter :check_admin

  before_filter :check_user 
  def check_user    
    redirect_to root_path, alert: 'Доступ ограничен' unless current_user.present? && !current_user.blocks &&(current_user.admin || current_user.moderator)
  end
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to admin_main_index_path, :alert => exception.message }
    end
  end

  def get_employees
    @departments = Department.order(:id)
    XlsEmployees.create_xls_employees(@departments)

    # if File.exist?("#{Rails.root}/public/docs/Телефонный справочник.xls")
    #   send_file(
    #       "#{Rails.root}/public/docs/Телефонный справочник.xls",
    #       filename: "Телефонный справочник.xls",
    #       type: "application/xls")
    # end
  end
  private
  def check_admin
    redirect_to root_path if current_user.present? && current_user.admin==false || current_user.blank?
  end


end
