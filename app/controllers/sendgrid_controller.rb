class SendgridController < ApplicationController
  def webhook
    envelope = JSON.parse(params[:envelope])
    to = envelope['to']
    list = List.find_by_address to
    mail_params = {
      from: params[:from],
      html: params[:html],
      subject: params[:subject],
      text: params[:text],
      to: list.address
    }
    mail_headers = {
      'Reply-To' => list.address,
      'X-Original-Sender' => envelope['from']
    }
    list.subscriptions.find_each do |subscription|
      RelayMailer.relay(
        mail_params,
        mail_headers.merge('Delivered-To' => subscription.email.address)
      ).deliver
    end
  ensure
    head :ok and return
  end
end
