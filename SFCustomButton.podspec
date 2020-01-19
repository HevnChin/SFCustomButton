
Pod::Spec.new do |s|

  s.name         = "SFCustomButton"
  s.version      = "0.0.3"
  s.summary      = "Free layout iocn textlabel button"
  s.homepage     = "https://github.com/WSFeng/SFCustomButton"

  s.license               = "MIT"
  s.author                = { "LUCA" => "iwangshengfeng@163.com" }
  s.social_media_url      = "https://twitter.com/iWSFeng"
  s.platform              = :ios, "9.0"
  s.source                = { :git => "https://github.com/WSFeng/SFCustomButton.git", :tag => "#{s.version}" }
  s.public_header_files   = 'SFCustomButton/SFCustomButton/Core/*.h'
  s.source_files          = 'SFCustomButton/SFCustomButton/Core/*.{h,m}'

  s.dependency 'Masonry'
  s.requires_arc = true
end
