Pod::Spec.new do |s|

  s.name         = "GQRatingView"
  s.version = "0.0.5"
  s.summary      = "五星评分RatingView，支持拖拽点击评分，可自定义五角星样式."

  s.homepage     = "https://github.com/g763007297/GQRatingView"
  # s.screenshots  = "https://github.com/g763007297/GQRatingView/blob/master/ScreenShot/demo.gif"

  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "developer_高" => "763007297@qq.com" }

  s.platform     = :ios
  s.platform     = :ios, "5.0"

  s.source       = { :git => "https://github.com/g763007297/GQRatingView.git", :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files  = "GQRatingView/*.{h,m}"

  #s.public_header_files = "GQRatingView/*.h"

end
