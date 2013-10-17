class User < ActiveRecord::Base

    has_many :issues
    has_many :comments
    has_one :role

end
