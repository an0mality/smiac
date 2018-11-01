class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :department, null: false
      t.string :surname, null: false
      t.string :name, null: false
      t.string :patronymic, null: false
      t.string :phone_number, null: false

    end
  end
end
