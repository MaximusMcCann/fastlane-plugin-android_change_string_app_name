describe Fastlane::Actions::AndroidChangeStringAppNameAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The android_change_string_app_name plugin is working!")

      Fastlane::Actions::AndroidChangeStringAppNameAction.run(nil)
    end
  end
end
