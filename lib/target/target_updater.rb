class TargetUpdater
  def initialize(log_level = Logger::DEBUG)
    @log_level = log_level
  end

  def update_reachability
    total_targets = Target.count
    reachable, unreachable = 0, 0
    logger.info("Updating rechability for #{total_targets} targets")
    Target.all.each_with_index do |target, index|
      logger.debug("PINGing target (#{target.address}) #{index + 1} of #{total_targets}")
      target.update_reachability!
      logger.debug("Target (#{target.address}) is #{target.reachable_in_word}")
      target.reachable ? reachable += 1 : unreachable += 1
    end
    logger.info("#{reachable} are reachable and #{unreachable} are unreachable")
  end


  private

  def logger
    @logger ||= begin
      logger = Logger.new(STDOUT)
      logger.level = @log_level
      logger
    end
  end
end
