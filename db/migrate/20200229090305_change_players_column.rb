class ChangePlayersColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :pob, :string
  end
end
