require "active_support"
require "active_support/core_ext"
require "podio"

class PodioAdapter
  def initialize(args = {})
    setup_podio!
  end

  private

  attr_reader :organization, :user, :user_input

  def app_id
    8636979 # https://podio.com/irisconnectcouk/ka-crm/apps/remote-installs
  end

  def api_secret
    ENV["PODIO_API_SECRET"]
  end

  def app_token
    ENV["PODIO_APP_TOKEN"]
  end

  def app_keys_missing?
    !app_keys_present?
  end

  def app_keys_present?
    app_token.present? && api_secret.present?
  end

  def setup_podio!
    raise "Please provide app tokens" if app_keys_missing?
    Podio.setup(api_key: "athena", api_secret: api_secret).tap do |client|
      client.authenticate_with_app(app_id, app_token)
    end
  end
end
