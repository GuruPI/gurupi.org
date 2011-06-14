Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    # GuruPI
    provider :facebook, '198713496841062', 'e5fd43fef551a56752764b1b322372fc'
  else
    # GuruPI Teste
    provider :facebook, '217866758240238', '22c31e695d0fb7f5cf2358e4a00741b3'
  end
end
