Pod::Spec.new do |s|
s.name         = "SFCustomButton"
s.version      = "0.0.5"
s.summary      = "Free layout iocn textlabel button IOS(9+)"
s.homepage     = 'https://github.com/WSFeng/SFCustomButton'
s.license      = { :type => 'MIT'}
s.author       = { "LUCA" => "iwangshengfeng@163.com" }
s.source   = { :git => 'https://github.com/WSFeng/SFCustomButton.git', :tag => "v#{s.version}" }
s.platform     = :ios, '9.0'
s.public_header_files   = 'Classs/*.h'
s.source_files          = 'Classs/*.{h,m}'
s.requires_arc  = true
end