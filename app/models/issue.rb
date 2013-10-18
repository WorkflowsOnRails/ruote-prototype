class Issue < ActiveRecord::Base

    belongs_to :developer, :class_name 'User'
    owned_by :user

    has_many :comments

end
