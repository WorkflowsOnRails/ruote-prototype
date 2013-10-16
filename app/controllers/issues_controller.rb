class IssuesController < ApplicationController

    def index
        # display the login screen if not logged in, the default view for user role if logged in
    end




    #look up the tutorial for how rails does these specific calls to create something




    def claim
        #check that role is developer
        #set that developer to be the user who claied this issue
    end


    def sign_off
        #check that role is Project Manager
        #set that developer to be the user who signed off this issue
    end





end
