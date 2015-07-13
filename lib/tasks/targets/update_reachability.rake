require 'target/target_updater'

namespace :targets do
  task update_reachability: :environment do
    updater = TargetUpdater.new(log_level = Logger::DEBUG)
    updater.update_reachability
  end
end
