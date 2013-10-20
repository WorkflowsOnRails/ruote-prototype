class IssuesController < ApplicationController

  def login
    redirect_to new_user_session_path #Hack because I cant seem to access the Devise controller in routes.rb
  end

  #show a list of issues
  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.save
    redirect_to @issue
  end

  def show
    @issue = Issue.find(params[:id])
  end



  def issue_params
    params.require(:issue).permit(:title, :description)
  end


end



#######################################################
#   synchronize processes:
#
#   blah = RuoteKit.engine.launch(def)
#   RuoteKit.engine.wait_for(blah)
#######################################################
#
#
#    pdef = Ruote.process_definition do
#        create_issue
#        concurrence do
#          claim_issue        
#          sign_issue
#        end
#        close issue
#    end
#
#    pdef = Ruote.process_definition do
#      create_issue
#      sign_issue
#    end
#
#    RuoteKit.engine.launch(pdef)
#
#    redirect_to new_user_session_path

