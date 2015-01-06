Pod::Spec.new do |s|
  s.name               = "KSURLValueTransformer"
  s.version            = "1.0.1"
  s.summary            = "A NSValueTransformer subclass for storing NSURLs in Core Data"
  s.homepage           = "https://github.com/Keithbsmiley/KSURLValueTransformer"
  s.license            = "MIT"
  s.author             = { "Keith Smiley" => "keithbsmiley@gmail.com" }
  s.social_media_url   = "http://twitter.com/SmileyKeith"
  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.8"
  s.source             = { :git => "https://github.com/Keithbsmiley/KSURLValueTransformer.git",
                           :tag => "v#{ s.version }" }
  s.source_files       = "*.{h,m}"
  s.requires_arc       = true
end
