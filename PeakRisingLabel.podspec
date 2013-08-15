Pod::Spec.new do |s|
  s.name         = "PeakRisingLabel"
  s.version      = "1.0.0"
  s.summary      = "动态展示上升的数字，并可以对这个数字进行格式化"
  s.homepage     = "https://github.com/conis/PeakRisingLabel"
  s.license      = 'MIT'
  s.author       = { "Conis" => "conis.yi@gmail.com" }
  s.source       = { :git => "https://github.com/conis/PeakRisingLabel.git", :commit => "51ade9f12d9a30c50f5b5cf8914f7bcbb99219e0"}
  s.platform     = :ios, '5.0'
  s.source_files = 'Peak', '*.{h,m}'
  s.framework  = 'UIKit'
  s.requires_arc = true
end
