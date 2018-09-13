class CreateDiaries < ActiveRecord::Migration[5.0]
  def change
    create_table :diaries do |t|
      t.string :title
      t.string :created_by

      t.timestamps
    end
  end
end
