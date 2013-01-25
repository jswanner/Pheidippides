class SendgridController < ApplicationController
  def webhook
    envelope = JSON.parse(params[:envelope])
    to = envelope['to']
    list = List.find_by_address to
    mail_params = {
      from: params[:from],
      html: params[:html],
      subject: params[:subject],
      text: params[:text]
    }
    mail_headers = {
      'Precedence' => 'list',
      'Reply-To' => list.address,
      'To' => list.address,
      'X-Original-Sender' => envelope['from']
    }
    list.subscriptions.find_each do |subscription|
      RelayMailer.relay(
        mail_params(to: subscription.email.address),
        mail_headers
      ).deliver
    end
  ensure
    head :ok and return
  end
end
