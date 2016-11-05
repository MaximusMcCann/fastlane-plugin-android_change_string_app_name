# android_change_string_app_name plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-android_change_string_app_name)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-android_change_string_app_name`, add it to your project by running:

```bash
fastlane add_plugin android_change_string_app_name
```

## About android_change_string_app_name

Change the app_name in the strings.xml file & revert method

Inupts:
```
newName: String  // The new name of your app
stringsFile: String (Optional) // The location to your strings.xml file.  Default: "app/src/main/res/values/strings.xml"
```

Usage:

```
android_change_string_app_name(newName: "AwesomeNewName")
android_change_string_app_name(newName: "AwesomeNewName", stringsFile: "path/to/your/strings.xml")
```

Sets these keys

`ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME : String` = The original value from android:label.

## About android_change_string_app_name_revert

Reverts the strings.xml app_name attribute to the prior ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME value.  Errors if ANDROID_CHANGE_STRING_APP_NAME_ORIGINAL_NAME is not set.

Inupts:
```
stringsFile: String (Optional) // The location to your strings.xml file.  Default: "app/src/main/res/values/strings.xml"
```

Usage:

```
android_change_string_app_name_revert()
android_change_string_app_name_revert(stringsFile: "path/to/your/strings.xml")

```


## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
