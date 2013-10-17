class CreateIssues < ActiveRecord::Migration
    def change
        create_table :issues do |t|

            t.references :creator #creator of the issue
            t.references :developer #developer assigned to the issue
            t.references :project_manager #project manager who sicned off the issue

            t.string :title
            t.text :description
            t.date :deployment_date
            t.boolean :claimed
            t.boolean :signed_off

            t.timestamps
        end
    end
end
