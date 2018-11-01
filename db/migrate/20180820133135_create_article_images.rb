class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.string :name, null: false
      t.belongs_to :tag	
      t.timestamps null: false
    end
  end
end
