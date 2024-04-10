class CreateForms < ActiveRecord::Migration[7.1]
  def change
    create_table :forms do |t|
      t.string :email
      t.string :name
      t.text :question

      t.timestamps
    end
  end
end
