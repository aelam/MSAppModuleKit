Pod::Spec.new do |s|
  s.name             = "MSAppModuleKit"
  s.version          = "1.0.0"
  s.summary          = "模块加载器 MSAppModuleKit."

  s.description      = <<-DESC
    MSAppModuleKit 负责模块的加载 以及模块的接口
    1. 应用模块实现MSAppModule协议
    2. 每一个模块扩展MSAppSettings协议
    3. 应用的AppSettings实现所需要加载的模块的AppSettings协议
    4. AppModuleController加载设置下发到
    5. AppModuleController加载模块

  DESC

  s.homepage         = "https://github.com/aelam/MSAppModuleKit.git"
  s.license          = 'MIT'
  s.author           = { "Ryan Wang" => "wanglun02@gmail.com" }
  s.source           = { :git => "https://github.com/aelam/MSAppModuleKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'MSAppModuleKit/Basic/**/*'
  s.frameworks   = 'UIKit', 'Foundation'
  s.dependency   'MSRoutes', '~> 1.2'

end
