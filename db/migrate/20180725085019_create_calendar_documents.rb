class CreateCalendarDocuments < ActiveRecord::Migration
  def change
    create_table :calendar_documents do |t|

      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.belongs_to :calendar_list, null: false
    end
  end
end
