class ChangeFieldArticle < ActiveRecord::Migration
  def change
  	remove_column :articles, :tag
  	add_column :articles, :article_image_id, :integer
  end
end
