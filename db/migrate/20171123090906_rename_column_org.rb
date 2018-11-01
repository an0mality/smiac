class RenameColumnOrg < ActiveRecord::Migration
  def change
  	rename_column :organizations, :type_org_id, :type_organization_id
  end
end
