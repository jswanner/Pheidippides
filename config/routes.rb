Pheidippides::Application.routes.draw do
  post 'sendgrid' => 'sendgrid/webhook'
end
