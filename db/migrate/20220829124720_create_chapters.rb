class CreateChapters < ActiveRecord::Migration[7.0]
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :description
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
