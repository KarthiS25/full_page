class SendMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts "Hi, there welcome this job"
  end
end
