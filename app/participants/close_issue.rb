class CloseIssue

  include Ruote::LocalParticipant

  def on_workitem
    puts "CloseIssue is working"

    puts workitem.fields
    puts workitem.lookup('id')

    issue = Issue.find(workitem.lookup('id'))
    issue.developer_id = 100

    issue.save


    reply #needed to signal Ruote that work is done
  end

  def on_cancel
    #called when workitem is canceled before it is finished
  end

end
