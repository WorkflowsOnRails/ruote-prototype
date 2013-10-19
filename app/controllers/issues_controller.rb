class IssuesController < ApplicationController


  def login
    #Hack because I cant seem to access the Devise controller in routes.rb
    redirect_to new_user_session_path
  end

  def view

    pdef = Ruote.process_definition do
      create_issue
    end

    RuoteKit.engine.launch(pdef)

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
