class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :name
      t.string :dojo
      t.string :lang
      t.text :comment

      t.timestamps null: false
    end
  end
end
