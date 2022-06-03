class CreateSpeakers < ActiveRecord::Migration[6.0]
  def change
    create_table :speakers do |t|
      t.string :image
      t.text :bio
      t.string :first_name
      t.string :last_name
      t.integer :event_id
      t.integer :department_id

      t.timestamps
    end
  end
end
