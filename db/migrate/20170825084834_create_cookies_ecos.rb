class CreateCookiesEcos < ActiveRecord::Migration
  def change
    create_table :cookies_ecos do |t|
      t.string :name, unique: true

      t.timestamps null: false
    end
  end
end
