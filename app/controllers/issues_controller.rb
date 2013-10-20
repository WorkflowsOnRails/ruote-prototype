class IssuesController < ApplicationController
  before_filter :authenticate_user!

  def login
    redirect_to new_user_session_path #Hack because I cant seem to access the Devise controller in routes.rb
  end

  #show a list of issues
  def index
    @issues = Issue.all

    #kill all ruote processes
    @temp = RuoteKit.engine.processes
    @temp.each do |p|
      RuoteKit.engine.cancel_process(p.wfid)
    end


  end

  def new
    require_role "reporter" or return
    @issue = Issue.new
  end

  def create
    require_role "reporter" or return

    @issue = Issue.new(issue_params)
    @issue.reporter_id = current_user.id
    @issue.save

    #set up process definition
    pdef = Ruote.process_definition do
      create_issue
      close_issue
    end

    #start the process, pass @issue as workitem
    RuoteKit.engine.launch(pdef, @issue)

    redirect_to @issue
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def destroy
    Issue.find(params[:id]).destroy
    redirect_to action: :index
  end

  def claim
    require_role "developer" or return

    @issue = Issue.find(params[:id])
    @issue.developer_id = current_user.id
    @issue.save

    redirect_to @issue
  end

  def sign_off
    require_role "manager" or return

    @issue = Issue.find(params[:id])
    @issue.signed_off = true
    @issue.save

    redirect_to @issue
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

