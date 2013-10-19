class ClaimIssue

  include Ruote::LocalParticipant

  def on_workitem
    puts "ClaimIssue is working"
    reply #needed to signal Ruote that work is done
  end

  def on_cancel
    #called when workitem is canceled before it is finished
  end

end
