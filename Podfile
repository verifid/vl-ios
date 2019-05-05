platform :ios, '11.0'

def product_pods
    pod 'VLiOS', :path => '.'
end

workspace 'vl-ios.xcworkspace'
project 'Sample/Sample.xcodeproj'

target 'Sample' do
    use_frameworks!
    inherit! :search_paths
    product_pods
end
