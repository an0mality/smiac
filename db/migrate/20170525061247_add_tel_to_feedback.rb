class AddTelToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :tel, :string
    add_column :feedbacks, :org_id, :integer
    add_column :feedbacks, :org_text, :string
    remove_column :feedbacks, :department
  end
end
