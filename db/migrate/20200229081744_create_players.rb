class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string  :name
      t.date    :dob
      t.date    :pob
      t.integer :age
      t.float   :height
      t.string  :position
      t.string  :foot
      t.string  :current_club

      t.timestamps
    end
  end
end
