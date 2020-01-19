Pod::Spec.new do |s|


  s.name         = "SFCustomButton"
  s.version      = "1.0.2"
  s.summary      = "SFCustomButton."
  s.description  = "Free layout iocn textlabel button IOS9+."
  s.homepage     = "https://github.com/WSFeng/SFCustomButton"
  s.license      = "MIT"
  s.author             = { "LUCA" => "iwangshengfeng@163.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/WSFeng/SFCustomButton.git", :tag => "1.0.2" }
  s.source_files  = "Classs/**/*.{h,m}"
  s.public_header_files   = "Classs/*.h"
  s.requires_arc  = true

  s.frameworks      = "UIKit"
end