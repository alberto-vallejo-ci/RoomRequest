class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :codeEvent
      t.string :eventType
      t.string :ponenteName
      t.string :personInCharge
      t.string :phoneNum
      t.boolean :forniture

      t.timestamps null: false
    end
  end
end
