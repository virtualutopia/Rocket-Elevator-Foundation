require 'dropbox_api'
class Customer < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :address

  has_many :buildings


  after_create :upload_attachment 

  def upload_attachment
    email = self.contact_email #Email of the new customer
    @client = DropboxApi::Client.new(ENV['DROPBOX_OAUTH_BEARER'])
    p "Email is : #{email}"
    i = 0
    # If  Email exists in Leads, upload the associated attached file into DropBox
    Lead.all.each do |l|
      if l.email == email
        i += 1
        p "Email found #{i}"
        if l.file_attachment != nil && self.contact_full_name != nil
          # file_content = IO.read "local_image.png"
          folder = self.contact_full_name.to_s
          p "A folde is created under the customer name ( #{folder} )" 
          file = @client.upload("/#{folder}/#{l.file_attachment.to_s}", "Hello Dropbox!")
        else 
          p "No attachement"
        end
      end
    end
  end

end

# c = Customer.new(id:31, address_id: 1, contact_email: "1@2.com")