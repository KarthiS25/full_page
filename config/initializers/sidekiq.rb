require 'sidekiq'
require 'sidekiq-scheduler'
require 'sidekiq/web'
require 'sidekiq-scheduler/web'

# schedule_file = "config/sidekiq_scheduler.yml"
# if File.exist?(schedule_file) && Sidekiq.server?
#   Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
# end

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq::Scheduler.dynamic = true
    Sidekiq.schedule = YAML.load_file(File.expand_path('../../sidekiq_scheduler.yml', __FILE__))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end

  config.redis = { url: 'redis://localhost:6379/0', namespace: "#{Rails.env}" }

  # config.redis = { url: 'redis://', password: Rails.application.credentials.dig(:redis_password), namespace: "#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0', namespace: "#{Rails.env}" }
  # config.redis = { url: 'redis://', password: Rails.application.credentials.dig(:redis_password), namespace: "#{Rails.env}" }
end
