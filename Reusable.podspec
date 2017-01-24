Pod::Spec.new do |s|
  s.name         = "Reusable"
  s.version      = "1.0.0"
  s.summary      = "A simple way of using Cells/Views with Xibs/Storyboards in Swift."
  s.homepage     = "https://github.com/Tinghui/Reusable"
  s.license      = 'MIT'
  s.author       = { 'Tinghui' => 'tinghui.zhang3@gmail.com' }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/Tinghui/Reusable.git", :tag => s.version }
  s.requires_arc = true
  s.source_files = 'Sources/*.swift'
  s.framework    = 'UIKit'
end
