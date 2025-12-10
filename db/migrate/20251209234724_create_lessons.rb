class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
