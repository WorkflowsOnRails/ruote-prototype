class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.references :developer
      t.references :reporter
      t.date :deployment_date
      t.boolean :signed_off
      t.timestamps
    end
  end
end
