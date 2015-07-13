require 'target/target_updater'

namespace :targets do
  task update_reachability: :environment do
    TargetUpdater.update_reachability
  end
end
