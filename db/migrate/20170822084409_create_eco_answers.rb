class CreateEcoAnswers < ActiveRecord::Migration
  def change
    create_table :eco_answers do |t|
      t.string :name, null: false
      t.references :eco_question, null: false

      t.timestamps null: false
    end
  end
end
