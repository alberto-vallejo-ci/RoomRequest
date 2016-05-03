class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.date :dateRequest
      t.date :dateEventI
      t.date :dateEventF
      t.time :timeEvent
      t.integer :eventCode
      t.string :nameRequesting
      t.string :phoneNum
      t.string :place

      t.timestamps null: false
    end
  end
end
