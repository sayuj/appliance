class Target < ActiveRecord::Base
  belongs_to :appliance

  validates :appliance_id, presence:   true

  validates :hostname,     presence:   true,
                           uniqueness: true

  validates :address,      presence:   true,
                           format:     {with: Resolv::IPv4::Regex}

  scope :reachables, -> { where reachable: true }
  scope :unreachables, -> { where reachable: false }

  def self.reachable_status
    { reachable_targets: reachables.count, unreachable_targets: unreachables.count }
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

  def reachable_in_word
    reachable ? 'reachable' : 'unreachable'
  end


  private

  def ping_logger
    @ping_logger ||= Logger.new('log/ping_logger.log')
  end
end
