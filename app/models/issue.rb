class Issue < ActiveRecord::Base

    belongs_to :developer, class_name: :user
    belongs_to :reporter, class_name: :user

    has_many :comments

end
