module Fastlane
  module Helper
    class AndroidChangeStringAppNameHelper
      # class methods that you define here become available in your action
      # as `Helper::AndroidChangeStringAppNameHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the android_change_string_app_name plugin helper!")
      end
    end
  end
end
