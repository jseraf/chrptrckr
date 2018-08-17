namespace :spin do
  desc 'Get most recently played song.'
  task :retrieve => :environment do
    RetrieveSpinService.call
  end
end
