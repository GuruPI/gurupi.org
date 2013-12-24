GurupiOrg::Application.configure do
  config.cache_classes                     = true
  config.consider_all_requests_local       = false
  config.perform_caching                   = true
  config.action_controller.perform_caching = true
  config.serve_static_assets               = false
  config.assets.compress                   = true
  config.assets.compile                    = false
  # config.assets.precompile << /extras\/.*\.(css|js|svg|eot|woff|ttf)$/i
  config.assets.digest = true
  config.i18n.fallbacks = true
  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
