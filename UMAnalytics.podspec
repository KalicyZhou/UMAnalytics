Pod::Spec.new do |s|
  s.name         = "UMAnalytics"
  s.version      = "3.4.7"
  s.summary      = "友盟统计sdk."
  s.description  = "友盟统计sdk，UMAnalytics_Sdk_3.4.7"
  s.license      = 'MIT'
  s.author       = { "kalicy" => "kalicy@icloud.com" }
  s.platform     = :ios
  s.source       = { :git => "git@github.com:KalicyZhou/UMAnalytics.git"}
  s.source_files  = 'UMAnalytics/*.{h,m}'

  # s.exclude_files = 'Classes/Exclude'
  # s.public_header_files = 'Classes/**/*.h'
  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"
  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.vendored_libraries = 'UMAnalytics/libMobClickLibrary.a'
  s.library   = 'z', 'MobClickLibrary'
  s.xcconfig = { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/UMAnalytics"' }
  # s.libraries = 'iconv', 'xml2'
  # s.requires_arc = true
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'

end
