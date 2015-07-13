require 'spec_helper'

describe Target, :type => :model do
  let(:appliance) {Appliance.create! name: 'app1', customer: 'WhiteHat'}

  describe "#address" do
    it "validates IP addresses" do
      target = Target.new hostname: 'foo', address: '8.8.8.8', appliance: appliance
      expect(target.valid?).to be(true)
    end

    it "fails bad IP addresses" do
      target = Target.new hostname: 'foo', address: '888.888.888.888', appliance: appliance
      expect(target.valid?).to be(false)
    end
  end

  # TODO: Rewrite
  describe '.update_reachability' do
    let(:target) { create(:target) }

    before do
      allow(Target).to receive(:all) { [target] }
    end

    it 'updates reachablity of each targets' do
      expect(target).to receive(:update_reachability!)
      Target.update_reachability
    end
  end

  describe '#update_reachability!' do
    it 'pings target address and update reachable status' do
      expect(subject).to receive(:ping?).and_return true
      subject.update_reachability!
      expect(subject.reachable).to be true
    end
  end

  describe '#ping?' do
    let(:ping_log) do
      %Q(PING google.com (216.58.220.46) 56(84) bytes of data.
      64 bytes from maa03s18-in-f14.1e100.net (216.58.220.46): icmp_seq=1 ttl=55 time=26.6 ms

      --- google.com ping statistics ---
      1 packets transmitted, 1 received, 0% packet loss, time 0ms
      rtt min/avg/max/mdev = 26.665/26.665/26.665/0.000 ms)
    end

    let(:unreachable_ping_log) { 'ping: unknown host google1.com' }

    it 'returns true for reachable address' do
      expect(subject).to receive(:ping).and_return ping_log
      expect(subject.ping?).to be true
    end

    it 'returns false for unreachable address' do
      expect(subject).to receive(:ping).and_return unreachable_ping_log
      expect(subject.ping?).to be false
    end

    it 'returns false for timed out address' do
      expect(subject).to receive(:ping).and_raise Timeout::Error
      expect(subject.ping?).to be false
    end
  end
end
