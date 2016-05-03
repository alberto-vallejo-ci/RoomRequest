class CreateAsistants < ActiveRecord::Migration
  def change
    create_table :asistants do |t|
      t.integer :code
      t.string :name
      t.string :carer
      t.integer :codeEvent

      t.timestamps null: false
    end
  end
end
