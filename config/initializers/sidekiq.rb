if Rails.env.production?
  sidekiq_config = { url: ENV['REDISTOGO_URL'] || ENV['REDIS_URL'] }
else
  sidekiq_config = { url: 'redis://127.0.0.1:6379' }
end

Sidekiq.configure_server do |config|
    config.redis = sidekiq_config.merge(size: 4)
end

Sidekiq.configure_client do |config|
    config.redis = sidekiq_config.merge(size: 2)
end
