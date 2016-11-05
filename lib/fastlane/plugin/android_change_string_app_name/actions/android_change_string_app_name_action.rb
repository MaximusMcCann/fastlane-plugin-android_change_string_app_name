module Fastlane
  module Actions
   module SharedValues
      ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME = :ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME
    end
    class AndroidChangeStringAppNameAction < Action
      def self.run(params)
        require 'nokogiri'

        newName = params[:newName]
        stringsFile = params[:stringsFile]

        doc = File.open(stringsFile) { |f|
          @doc = Nokogiri::XML(f)

          puts @doc

          originalName = nil

          @doc.css("resources string[@name=app_name]").each do |response_node|
            originalName = response_node.content
            response_node.content = newName

            UI.message("Updating app name to: #{newName}")
          end

          Actions.lane_context[SharedValues::ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME] = originalName

          File.write(stringsFile, @doc.to_xml)
        }

      end

      def self.description
        "Change the app_name in the strings.xml file & revert method"
      end

      def self.authors
        ["MaximusMcCann"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "Change the app_name in the strings.xml file & revert method"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :newName,
                                  env_name: "",
                               description: "The new name for the app",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :stringsFile,
                                  env_name: "",
                               description: "Optional custom location for strings.xml",
                                  optional: false,
                                      type: String,
                             default_value: "app/src/main/res/values/strings.xml")
        ]
      end

      def self.output
        [
          ['ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME', 'The original app name.']
        ]
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end

    class AndroidChangeStringAppNameRevertAction < Action
      def self.run(params)
        require 'nokogiri'

        oldName = Actions.lane_context[SharedValues::ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME]

        if oldName.to_s.strip.length != 0
          stringsFile = params[:stringsFile]
        else
          UI.error("no string for ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME.  Have you run android_change_string_app_name?")
        end

        doc = File.open(stringsFile) { |f|
          @doc = Nokogiri::XML(f)

          @doc.css("resources string[@name=app_name]").each do |response_node|
            response_node.content = oldName

            UI.message("Reverting app name to: #{oldName}")
          end

          File.write(stringsFile, @doc.to_xml)
        }

      end

      def self.description
        "Revert strings.xml app_name using ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME"
      end

      def self.authors
        ["MaximusMcCann"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        "Revert strings.xml app_name using ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :stringsFile,
                                  env_name: "",
                               description: "Optional custom location for strings.xml",
                                  optional: false,
                                      type: String,
                             default_value: "app/src/main/res/values/strings.xml")
        ]
      end

      def self.is_supported?(platform)
        platform == :android
      end
    end
  end
end
