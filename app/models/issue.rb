class Issue < ActiveRecord::Base

    belongs_to :creator, :class_name => 'User'
    belongs_to :developer, :class_name => 'User'
    belongs_to :project_manager, :class_name => 'User'

    has_many :comments

end
