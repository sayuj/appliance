class TargetUpdater
  def self.update_reachability
    Target.all.each(&:update_reachability!)
  end
end
