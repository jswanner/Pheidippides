class SendgridController < ApplicationController
  def webhook
    head :ok
  end
end
