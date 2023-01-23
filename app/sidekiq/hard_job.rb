require 'sidekiq-scheduler'
class HardJob
  include Sidekiq::Job
  queue_as :default

  def perform
    # Do something
    puts "Hello world!!"
  end
end