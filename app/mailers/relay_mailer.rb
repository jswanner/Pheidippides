class RelayMailer < ActionMailer::Base
  def relay mail_params, mail_headers
    headers mail_headers
    mail mail_params
  end
end
