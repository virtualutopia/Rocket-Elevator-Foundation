class ApplicationMailer < ActionMailer::Base
  default from: 'info@rocketelevatorsworld.com'
  layout 'mailer'

  require 'sendgrid-ruby'
  include SendGrid

  # Legacy template with Mail Helper Class
  mail = SendGrid::Mail.new
  mail.from = Email.new(email: 'info@rocketelevatorsworld.com')
  mail.subject = 'I\'m replacing the subject tag'
  personalization = Personalization.new
  personalization.add_to(Email.new(email: 'groovy6879@hotmail.com'))
  personalization.add_substitution(Substitution.new(key: '-full_name-', value: 'Example User'))
  personalization.add_substitution(Substitution.new(key: '-project_name-', value: 'Denver'))

  # Transactional template with Mail Helper Class
  # mail = Mail.new
  # mail.from = Email.new(email: 'info@rocketelevatorsworld.com')
  # personalization = Personalization.new
  # personalization.add_to(Email.new(email: 'groovy6879@hotmail.com'))
  # personalization.add_dynamic_template_data({
  #     "subject" => "Thank you for contacting us!",
  #     "full_name" => "Example User",
  #     "project_name" => "Denver"
  #   })
  
  mail.add_personalization(personalization)
  mail.template_id = 'd-914f77d8b1a546c3b80d6d6ba05bd4e7'

  sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
  begin
      response = sg.client.mail._("send").post(request_body: mail.to_json)
  rescue Exception => e
      puts e.message
  end
  puts response.status_code
  puts response.body
  puts response.parsed_body
  puts response.headers

end