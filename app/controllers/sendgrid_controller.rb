class SendgridController < ApplicationController
  def webhook
    envelope = JSON.parse(params[:envelope])
    to = envelope['to']
    list = List.find_by_address to
    mail_params = {
      from: envelope['from'],
      html: params[:html],
      subject: params[:subject],
      text: params[:text]
    }
    list.subscriptions.find_each do |subscription|
      RelayMailer.relay(mail_params.merge(to: subscription.email.address)).deliver
    end
    head :ok
  rescue
    head :ok
  end
end
