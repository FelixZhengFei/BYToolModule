

Pod::Spec.new do |s|

  s.name         = "BYToolModule"
  s.version      = "1.2.2"
  s.summary      = "my BYToolModule"

  s.description  = <<-DESC
                            BYToolModule 是一个用于保存一些常用工具,控件类,各类类别类的工具
                   DESC

  s.homepage     = "https://github.com/FelixZhengFei/BYToolModule"

  s.license      = "MIT"

  s.author             = { "郑强飞" => "704811790@qq.com" }
  s.platform     = :ios, "8.0"


  s.source       = { :git => "https://github.com/FelixZhengFei/BYToolModule.git", :tag => "1.2.2" }

  s.subspec 'extension' do |ss|
    ss.source_files = "BYToolModule/BYToolModule/extension/*.{swift}"
  end


  s.requires_arc = true


end
