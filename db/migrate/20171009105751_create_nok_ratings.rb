class CreateNokRatings < ActiveRecord::Migration

  def change
    create_table :nok_types do |t|
      t.string :name, null: false
    end

    create_table :nok_marks do |t|
      t.text :description, null: false
    end

    create_table :nok_years do |t|
      t.integer :year, null: false
    end

    create_table :nok_ratings do |t|
      t.references :organization, null: false, index: true
      t.references :nok_type, null: false
      t.references :nok_mark, null: false
      t.references :nok_year, null: false
      t.integer :result, null: false
    end
  end
end
