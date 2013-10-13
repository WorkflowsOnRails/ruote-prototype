class IssuesController < ApplicationController

    def index
        # display the view that shows the input fields required to create an issue
    end

    def create
        #create the issue
        #start the work participants for the current issue
            #note sure what they will be actually doing though...

        render text: 'BLAH'
    end

    def destroy
        #close the issue
    end

end
