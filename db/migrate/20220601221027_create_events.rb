class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :zoom_url
      t.integer :user_id
      t.integer :speaker_id
      t.integer :venue_id
      t.integer :department_id
      t.string :title

      t.timestamps
    end
  end
end
