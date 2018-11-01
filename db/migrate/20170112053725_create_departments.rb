class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :cabinet_number, null: false
      t.text :description
    end
  end
end
