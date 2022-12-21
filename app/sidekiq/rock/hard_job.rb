class Rock::HardJob
  include Sidekiq::Job

  def perform(name, count)
    # Do something
  end
end
