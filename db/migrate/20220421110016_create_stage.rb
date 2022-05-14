class CreateStage < ActiveRecord::Migration[6.1]
  def change
    create_table :stages do |t|
      t.string :name
      t.string :color
      t.integer :position
      t.references :project
      t.timestamps
    end
  end
end
