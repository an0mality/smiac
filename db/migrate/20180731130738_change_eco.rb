class ChangeEco < ActiveRecord::Migration
  def change
  	add_column :eco_questions, :old, :boolean, default: false
  	add_column :eco_answers, :old, :boolean, default: false
  	add_column  :eco_questions, :position, :integer
  end
end
