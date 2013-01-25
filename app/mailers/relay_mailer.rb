class RelayMailer < ActionMailer::Base
  def relay mail_params
    mail mail_params
  end
end
