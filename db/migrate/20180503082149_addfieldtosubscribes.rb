class Addfieldtosubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :consent_to_the_processing_of_personal_data, :boolean, default: false
  end
end
