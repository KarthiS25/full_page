require 'sidekiq-scheduler'
class HardJob
  include Sidekiq::Job

  def perform()
    # Do something
    puts "Hello sidekiq"
  end
end