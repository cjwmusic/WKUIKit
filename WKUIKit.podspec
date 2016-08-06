#
# Be sure to run `pod lib lint WKUIKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WKUIKit'
  s.version          = '0.1.2'
  s.summary          = 'WKUIKit provide some categories of UIView for easy to layout your views~'

  s.description      = "WKUIKit provide some categories of UIView for easy to layout your views~,Enjoy~"

  s.homepage         = 'https://github.com/cjwmusic/WKUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wukong' => 'caijunwei1990@163.com' }
  s.source           = { :git => 'https://github.com/cjwmusic/WKUIKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WKUIKit/Classes/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.frameworks = 'UIKit'
  s.dependency 'HexColors'
  s.dependency 'SDWebImage'

end
