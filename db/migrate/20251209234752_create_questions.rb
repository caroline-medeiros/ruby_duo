class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
