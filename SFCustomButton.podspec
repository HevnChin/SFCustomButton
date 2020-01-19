Pod::Spec.new do |s|
s.name         = "SFCustomButton"
s.version      = "1.0.0"
s.summary      = "Free layout iocn textlabel button IOS9+"
s.homepage     = 'https://github.com/WSFeng/SFCustomButton'
s.license      = { :type => 'MIT'}
s.author       = { "LUCA" => "iwangshengfeng@163.com" }
s.source   = { :git => 'https://github.com/WSFeng/SFCustomButton.git', :tag => "1.0.0" }
s.platform     = :ios, '9.0'
s.public_header_files   = 'Classs/*.h'
s.source_files          = 'Classs/*'
s.requires_arc  = true
end