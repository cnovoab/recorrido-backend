
if Rails.env.production?
  Sidekiq.configure_server do |config|
      config.redis = { url: ENV['REDISTOGO_URL'] || ENV['REDIS_URL'], size: 4 }
  end

  Sidekiq.configure_client do |config|
      config.redis = { url: ENV['REDISTOGO_URL'] || ENV['REDIS_URL'], size: 2 }
  end
else
  sidekiq_config = { url: 'redis://127.0.0.1:6379' }
  Sidekiq.configure_server do |config|
      config.redis = sidekiq_config
  end

  Sidekiq.configure_client do |config|
      config.redis = sidekiq_config
  end

end
