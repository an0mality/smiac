class AddCountDownloadToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :count_download, :integer, default:0
  end
end
