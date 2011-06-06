Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'fKgRobkfbM1b2TDrVTrBdQ', 'EhjAJW4Ypbozzoa9mgoWbV4h6agvQg4N7CfqwVNI'
 # provider :facebook , 'app' , 'secret'# , {:scope => 'publish_stream,offline_access,email'}
end

