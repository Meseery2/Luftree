platform :ios, '10.0'

target 'Luftree' do
  use_frameworks!
  pod 'Alamofire'
  pod 'SearchTextField'

  target 'LuftreeTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble'
  end
  
  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          if config.name == 'Release'
              config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
          end
      end
  end
end
