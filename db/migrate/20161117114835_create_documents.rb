class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.belongs_to :user, null: false
      t.belongs_to :document_stage, null: false
      t.timestamps
    end
  end
end
