class CreateFaqRmisThemes < ActiveRecord::Migration
  def change
    create_table :faq_rmis_themes do |t|
      t.string :name, null: false
    end
  end
end
