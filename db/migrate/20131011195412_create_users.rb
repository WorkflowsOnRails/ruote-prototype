class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role
      t.timestamps
    end
  end
end
