class RelayMailer < ActionMailer::Base
  def relay mail_params, mail_headers
    html = mail_params.delete :html
    text = mail_params.delete :text

    headers mail_headers

    mail mail_params do |format|
      format.html { render text: html }
      format.text { render text: text }
    end
  end
end
