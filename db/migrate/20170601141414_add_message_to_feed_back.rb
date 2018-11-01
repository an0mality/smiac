class AddMessageToFeedBack < ActiveRecord::Migration
  add_column :feedbacks, :message, :string
  remove_column :feedbacks, :org_id
end
