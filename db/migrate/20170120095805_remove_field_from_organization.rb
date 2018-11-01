class RemoveFieldFromOrganization < ActiveRecord::Migration
  def change
    remove_column :organizations, :city_id
    remove_column :organizations, :city_code
  end
end
