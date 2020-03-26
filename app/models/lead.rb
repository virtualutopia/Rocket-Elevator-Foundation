class Lead < ActiveRecord::Base

    after_create :send_email
  def send_email
      UserNotifierMailer.send_lead_email(self).deliver_now
     
  end

  private

  def lead_params
    params.require(:lead).permit(:email, :full_name, :project_name)
  end
end