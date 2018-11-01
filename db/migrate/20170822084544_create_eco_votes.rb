class CreateEcoVotes < ActiveRecord::Migration
  def change
    create_table :eco_votes do |t|
      t.text :description
      t.integer :number, null: false
      t.references :eco_question, index:true, null: false
      t.references :eco_answer, index:true
      t.timestamps null: false
    end
  end
end
