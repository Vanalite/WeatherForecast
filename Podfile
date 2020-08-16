# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'WeatherForecast' do
    # Comment the next line if you don't want to use dynamic frameworks
    use_frameworks!

    # ignore all warnings from all pods
    inhibit_all_warnings!
    pod 'Moya-ObjectMapper/RxSwift', '~> 2.8'
    pod 'RealmSwift', '3.19.1'
    pod 'ObjectMapper+Realm'
    pod 'SwiftyJSON', '~> 4.0'
    pod 'RxOptional', '~> 3.6.2'
    pod 'RxRealm', '~> 0.7.6'
    pod 'SnapKit', '~> 4.2.0'

  # Pods for WeatherForecast
#    post_install do |installer|
#        installer.pods_project.targets.each do |target|
#            target.build_configurations.each do |config|
#                if config.name == 'Debug'
#                    config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
#                    config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
#                end
#                
#                # Disable code coverage for all Pods and Pods Project
#                config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
#                
#                # Force all modules swift versions to 4.2
#                config.build_settings['SWIFT_VERSION'] = '4.2'
#
#            end
#        end
#    end
#    
#    installer.pods_project.build_configurations.each do |config|
#        config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
#    end
end

target 'WeatherForecastTests' do
    inherit! :search_paths
    # Pods for testing
    use_frameworks!
    inhibit_all_warnings!
    pod 'Nimble', '~> 8.0.1'
    pod 'Cuckoo', '~> 1.3.0'
    pod 'RxTest', '~> 4.5.0'
    pod 'RxBlocking', '~> 4.5.0'
end
