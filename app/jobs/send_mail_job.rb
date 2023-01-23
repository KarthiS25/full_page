class SendMailJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    puts "Hi, there welcome this job"
   
    UserMailer.run.deliver_now
  end
end
