Koala.configure do |config|
  config.app_id = Rails.application.credentials.facebook_app_id
  config.app_secret = Rails.application.credentials.facebook_app_secret
end
