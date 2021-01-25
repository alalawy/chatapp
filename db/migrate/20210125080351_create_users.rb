class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nama
      t.string :nomorHp
      t.integer :status

      t.timestamps
    end
  end
end
