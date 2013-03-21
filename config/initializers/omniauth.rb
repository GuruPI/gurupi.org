Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    # GuruPI
    provider :facebook, '198713496841062', 'e5fd43fef551a56752764b1b322372fc'
    provider :github, '60d3a7c1de1aa8c144b3', 'ea98b33c875de16fdf744c70516abdde64021fac'
  else
    # GuruPI Teste
    provider :facebook, '217866758240238', '22c31e695d0fb7f5cf2358e4a00741b3'
    provider :github, 'ce4651e4408a4ab23d7f', '09bb99877399a43c9fae6714c07ae1469f462cdf'
  end
end

OmniAuth.config.on_failure = SessionsController.action(:failure)
