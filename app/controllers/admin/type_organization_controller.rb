class Admin::TypeOrganizationController < Admin::ApplicationController
	load_and_authorize_resource param_method: :type_params
	
  before_action :types
  
  def index
    @type=TypeOrganization.new
  end

  def show
    @type = TypeOrganization.find(params[:id])
    
  end
 
  def create
    @type_orgs = TypeOrganization.create(type_params)
    
    respond_to do |f|
      if @type_orgs.save
        f.js { render layout: false, content_type: 'text/javascript' } 
      else     
       render js: "alert('Ошибка при сохранении')"
      end
    end
  end

  
  
  def update
    @type= TypeOrganization.find(params[:id])
    if type_params.present?
      respond_to do |format|
      if @type.update_attributes(type_params)
        format.html { redirect_to(@type, :notice => 'Запись изменена') }
        format.json { respond_with_bip(@type) }
      else
        format.html { render :action => "index" }
        format.json { respond_with_bip(@type) }
      end
    end
  end

  end

  def destroy
    record = TypeOrganization.find(params[:id])
    respond_to do |f|
      if record.destroy.present?
        f.js { render layout: false, content_type: 'text/javascript' }      
      else
        f.js {render js: "alert('Ошибка при удалении. За данным типом закреплены организации или запись перемещена или не существует')"}
      end        
    end
  end
 
 private

 def types
  @types = TypeOrganization.order(id: :desc)
 end

  
  def type_params
    params.require(:type_organization).permit(:name)
  end


end
