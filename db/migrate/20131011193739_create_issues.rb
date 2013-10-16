class CreateIssues < ActiveRecord::Migration
    def change
        create_table :issues do |t|

            t.references :user #creater of the issue
            t.references :user #developer assigned to the issue
            t.references :user #project manager who sicned off the issue

            t.string :title
            t.text :description
            t.date :deployment_date
            t.boolean :signed_off

            t.timestamps
        end
    end
end
