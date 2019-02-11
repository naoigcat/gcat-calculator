require 'dotenv'
Dotenv.load

platform :ios, '12.1'

inhibit_all_warnings!

target 'GcatCalculator' do
  target 'GcatCalculatorTests' do
    inherit! :search_paths
  end
  target 'GcatCalculatorUITests' do
    inherit! :search_paths
  end
end

pre_install do |installer|
  installer.analysis_result.targets.each do |target|
    specification = ::Pod::Specification.new do |specification|
      specification.name = 'XCConfig'
      specification.user_target_xcconfig = { 'DEVELOPMENT_TEAM' => ENV['DEVELOPMENT_TEAM'] }
    end
    target.pod_targets << ::Pod::PodTarget.new [specification], [target_definitions['GcatCalculator']], installer.sandbox
  end
end
