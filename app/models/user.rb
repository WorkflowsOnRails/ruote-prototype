class User < ActiveRecord::Base

    has_many :issues
    has_many :comments

    has_and_belongs_to_many :roles

end
