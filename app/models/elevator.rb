# you may test the Slack either via console or via app Admin panel.
    # in console create a new Elevator ans save //  like this: elevator = Elevator.new(id:1009, column:Column.first, serial_number:1234444444321, status: "Active")
    # then change the status and save again // like this: elevator.status = "new status"


# required for Slack_messanger
require 'http'
require 'json'

class Elevator < ApplicationRecord
    belongs_to :column
    
    after_update :slack_status_messenger, if: :status_changed

    def slack_status_messenger
        puts "!!!!!!update occured!!!!!"
        rc = HTTP.post("https://slack.com/api/chat.postMessage", params:{
            token: ENV['SLACK_API_TOKEN'],
            channel: ENV['SLACK_WEBHOOK_CHANNEL'],
            text: ( "The Elevator [id = " + self.id.to_s + "] with Serial Number [" + (self.serial_number.to_s) + "] changed status form " + (self.previous_changes[:status][0].upcase) + " to " + (self.previous_changes[:status][1].upcase)+ ".") ,
            as_user: true
        })
        puts JSON.pretty_generate(JSON.parse(rc.body))
    end

    def status_changed
        self.previous_changes[:status] != nil
    end

end
