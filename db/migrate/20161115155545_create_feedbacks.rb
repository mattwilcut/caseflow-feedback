class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :application
      t.string :username
      t.text :feedback

      t.timestamps null: false
    end
  end
end
