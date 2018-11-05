Warden::JWTAuth.configure do |config|
  config.secret = 'super-secret'
  config.mappings = { default: User }
  config.dispatch_requests = [['POST', %r{^/api/v1/login$}]]
end
