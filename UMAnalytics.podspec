Pod::Spec.new do |s|
  s.name         = "UMAnalytics"
  s.version      = "2.2.1"
  s.summary      = "友盟统计sdk."
  s.description  = "友盟统计sdk，UMAnalytics_Sdk_2.2.1.OpenUDID"
  s.homepage     = "https://github.com/liyoro/UMAnalytics"
  s.license      = 'MIT'
  s.author       = { "liyoro" => "liyoro.li@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/liyoro/UMAnalytics.git", :commit => "7e7807281b293804d6fd0c012b67bc7365439cb1"}
  s.source_files  = 'UMAnalytics/MobClick.{h}', 'UMAnalytics/libMobClickLibrary.{a}'

  # s.exclude_files = 'Classes/Exclude'
  # s.public_header_files = 'Classes/**/*.h'
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'

  s.library   = 'z'

  # s.libraries = 'iconv', 'xml2'
  # s.requires_arc = true
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
