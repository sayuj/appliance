class Target < ActiveRecord::Base
  belongs_to :appliance

  validates :appliance_id, presence:   true

  validates :hostname,     presence:   true,
                           uniqueness: true

  validates :address,      presence:   true,
                           format:     {with: Resolv::IPv4::Regex}

  scope :reachables, -> { where reachable: true }

  def self.reachable_status
    { total_targets: count, reachable_targets: reachables.count }
  end

  def self.update_reachability
    all.each(&:update_reachability!)
  end

  def update_reachability!
    self.reachable = ping?
    self.save
  end

  def ping?
    Timeout::timeout(0.005) { ping.include? '1 received' }
  rescue Timeout::Error
    false
  end

  def ping
    ping_log = `ping -c1 #{address}`
    ping_logger.info(ping_log)
    ping_log
  end


  private

  def ping_logger
    @ping_logger ||= Logger.new('log/ping_logger.log')
  end
end
