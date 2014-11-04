class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :image
      t.string :url, null:false
      t.string :source, null:false
      t.text :description, null:false

      t.timestamps
    end
  end
end
