class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
    	t.string :mail, null: false
    	t.boolean :email_confirmed, default: false
    	t.string :confirm_token
    	t.boolean :articles,default: false
    	t.boolean :documents,default: false

      t.timestamps null: false
    end
  end
end
