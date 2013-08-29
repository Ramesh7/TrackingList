class UserMailer < ActionMailer::Base
  default to: "rameshsencha7@gmail.com"

  def tracking_list_mail_demo
    Rails.logger.debug "-------------------------------------------------------"
    mail( subject:  "Test Mail for Tracking List",
          from:     "ramesh.sencha@synechron.com",
          content_type: "text/html")
  end

end
