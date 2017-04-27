Pod::Spec.new do |s|
  s.name             = 'BubblePictures'
  s.version          = '0.1.18'
  s.summary          = 'Framework for showing bubbles like pictures.'
  s.description      = 'Framework for showing bubbles like pictures inside a collection View, the frameworks handles everything for you, you just need to pass the pictures with the titles and thats it.'
  s.homepage         = 'https://github.com/kbelter/BubblePictures'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Kevin Belter' => 'kevin.belter@outlook.com' }
  s.source           = { :git => 'https://github.com/kbelter/BubblePictures.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'BubblePictures/Classes/**/*'
  s.resource_bundles = {
     'BubblePictures' => ['BubblePictures/Assets/**/*']
    }
  s.frameworks = 'UIKit'
  s.dependency 'SDWebImage', '3.8'
end
