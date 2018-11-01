class CreateFaqRmisAnswers < ActiveRecord::Migration
  def change
    create_table :faq_rmis_answers do |t|
      t.belongs_to :faq_rmis_theme, null: false
      t.text :question, null: false
      t.text :description, nuull: false
    end
  end
end
