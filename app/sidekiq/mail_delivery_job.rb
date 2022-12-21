class MailDeliveryJob
    include Sidekiq::Job

    def perform(name, count)

    end
end