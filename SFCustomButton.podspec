
Pod::Spec.new do |spec|

  spec.name         = "SFCustomButton"
  spec.version      = "0.0.1"
  spec.summary      = "Free layout iocn textlabel button"
  spec.homepage     = "https://github.com/WSFeng/SFCustomButton"

  spec.license            = "MIT"
  spec.author             = { "LUCA" => "iwangshengfeng@163.com" }
  spec.social_media_url   = "https://twitter.com/iWSFeng"
  spec.platform          = :ios, "9.0"
  spec.source             = { :git => "https://github.com/WSFeng/SFCustomButton.git", :tag => "#{spec.version}" }

  spec.source_files  = "SFCustomButton", "SFCustomButton/SFCustomButton/Core/**/*.{h,m}"

  spec.public_header_files = "SFCustomButton/SFCustomButton/Core/**/*.h"

  spec.dependency 'Masonry'
  spec.requires_arc = true
end
