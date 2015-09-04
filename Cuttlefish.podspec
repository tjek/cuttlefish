Pod::Spec.new do |s|
  s.name     = 'Cuttlefish'
  s.version  = '0.1'
  s.summary      = 'Color extensions to generate color palette shades'

  s.homepage     = 'https://github.com/shopgun/cuttlefish'
  s.license      = 'MIT'
  s.author       = { "Laurie Hufford" => "lh@shopgun.com" }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source       = {
    :git => "https://github.com/shopgun/cuttlefish.git",
    :tag => "v" + s.version.to_s
  }

  s.source_files = 'Cuttlefish/*.{h,m}'

end
