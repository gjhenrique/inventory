class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.float :unit_value
      t.float :taxes

      t.timestamps
    end
  end
end
