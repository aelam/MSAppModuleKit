#
# Be sure to run `pod lib lint MSAppModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MSAppModuleKit"
  s.version          = "0.0.1"
  s.summary          = "模块加载器 MSAppModuleKit."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-DESC
MSAppModuleKit 负责模块的加载 以及模块的接口
1. 应用模块实现MSAppModule协议
2. 每一个模块扩展MSAppSettings协议
3. 应用的AppSettings实现所需要加载的模块的AppSettings协议
4. AppModuleController加载设置下发到
5. AppModuleController加载模块

DESC

s.homepage         = "http://ph.benemind.com/diffusion/MODULE"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "Ryan Wang" => "wanglun02@gmail.com" }
s.source           = { :git => "http://ph.benemind.com/diffusion/MODULE/MSAppModuleKit.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'

s.frameworks = 'UIKit', 'Foundation'
s.dependency 'JLRoutes'

end
