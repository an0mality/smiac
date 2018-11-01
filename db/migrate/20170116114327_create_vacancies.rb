class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :name, null: false
      t.string :pay
      t.text :requirements
      t.text :responsibility
      t.text :contacts
      t.boolean :actual, default: true
      t.timestamps null: false
    end
  end
end
