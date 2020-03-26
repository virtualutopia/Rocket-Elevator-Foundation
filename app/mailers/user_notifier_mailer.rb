class UserNotifierMailer < ApplicationMailer
    default :from => 'info@rocketelevatorsworld.com'
  
    # send a lead email to the user, pass in the user object that contains the user's email address
    def send_lead_email(lead)
      @lead = lead
      p lead
      mail( :to => @lead.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end
  end