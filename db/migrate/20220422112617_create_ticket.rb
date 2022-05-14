class CreateTicket < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.references :stage
      t.timestamps
    end
  end
end
