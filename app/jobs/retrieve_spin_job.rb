class RetrieveSpinJob < ApplicationJob
  queue_as :default

  def perform
    # This calls your existing Rake task logic
    RetrieveSpinService.call
  end
end
