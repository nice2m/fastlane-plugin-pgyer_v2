describe Fastlane::Actions::PgyerV2Action do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The pgyer_v2 plugin is working!")

      Fastlane::Actions::PgyerV2Action.run(nil)
    end
  end
end
