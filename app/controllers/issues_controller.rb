class IssuesController < ApplicationController
  #before_action :authentiate_user!

  def login
    #Hack because I cant seem to access the Devise controller in routes.rb
    redirect_to new_user_session_path
  end

  def view

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
