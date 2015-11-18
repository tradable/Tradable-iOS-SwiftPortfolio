SwiftPortfolio is a simple project written in Swift. It aims to show how to set up a project with TradableAPI framework and how to use the API.

Here are the most important steps when it comes to importing TradableAPI framework into your Swift project in XCode:

1. Copy the <i>TradableAPI.framework</i> into your project directory.
2. Drag the framework to <i>Embedded Binaries</i> section in your project settings.
3. In <i>Build Settings</i>:
  a) set <i>Embedded Content Contains Swift Code</i> to <i>Yes</i>,
  b) under <i>Search Paths</i>, in <i>Framework Search Paths</i>, add <i>$(PROJECT_DIR)/YourProjectName/TradableAPI.framework</i> and <i>$(PROJECT_DIR)/YourProjectName</i>.
4. Add <i>import TradableAPI</i> line in your .m files where you want to use the API functionality.
