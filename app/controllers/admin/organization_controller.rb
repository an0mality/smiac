class Admin::OrganizationController < Admin::ApplicationController 
 
  
  load_resource param_method: :org_params
  load_resource :class=> Organization
  
  authorize_resource

  def index
    @orgs = TypeOrganization.where(id: params[:type_organization_id]).joins(:organizations)
    # @all_org_type = TypeOrganization.order(:name)
    
  end

  def show
    @organization = Organization.find(params[:id])
    
  end

  
  def create
    Organization.create(org_params)
    redirect_to :back, notice: 'Запись добавлена'
  end

  def update
    Organization.find(params[:id]).update_attributes(org_params)
    redirect_to :back, notice: 'Запись изменена'
  end

  def destroy
    Organization.find(params[:id]).destroy
    redirect_to :back, notice: 'Запись удалена'
  end

  
  private
  def org_params
    params.require(:organization).permit!
  end

  

  
end
