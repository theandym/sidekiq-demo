class Worker
  include Sidekiq::Worker
  def perform
    sleep 5
  end
end
