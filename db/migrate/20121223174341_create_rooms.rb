class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :session_id
      t.boolean :public

      t.timestamps
    end
  end
end
