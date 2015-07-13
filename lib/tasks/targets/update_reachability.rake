namespace :targets do
  task update_reachability: :environment do
    Target.update_reachability
  end
end
