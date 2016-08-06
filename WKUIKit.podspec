
Pod::Spec.new do |s|
  s.name             = 'WKUIKit'
  s.version          = '0.1.4'
  s.summary          = 'WKUIKit provide some categories of UIView for easy to layout your views~'

  s.description      = "WKUIKit provide some categories of UIView for easy to layout your views~,Enjoy~"

  s.homepage         = 'https://github.com/cjwmusic/WKUIKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wukong' => 'caijunwei1990@163.com' }
  s.source           = { :git => 'https://github.com/cjwmusic/WKUIKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '7.0'

  s.source_files = 'Pod/**/*.{h,m}'

  s.public_header_files = 'Pod/**/*.{h}'

  s.frameworks = 'UIKit'

  s.dependency 'HexColors'
  s.dependency 'SDWebImage'

end
