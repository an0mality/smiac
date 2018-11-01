class AddColumnToArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :count_views, :integer, default: 0
  end
end
