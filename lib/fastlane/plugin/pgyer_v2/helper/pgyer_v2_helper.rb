require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class PgyerV2Helper
      # class methods that you define here become available in your action
      # as `Helper::PgyerV2Helper.your_method`
      #
      def self.show_message
        UI.message("Hello from the pgyer_v2 plugin helper!")
      end
    end
  end
end
