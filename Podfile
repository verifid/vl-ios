platform :ios, '11.0'
use_frameworks!

def product_pods
    pod 'VLiOS', :path => '.'
end

workspace 'vl-ios.xcworkspace'

target 'vl-ios' do
    project 'vl-ios.xcodeproj'

    target 'vl-iosTests' do
        inherit! :search_paths
        pod 'OHHTTPStubs/Swift'
    end
end

target 'Sample' do
    project 'Sample/Sample.xcodeproj'
    inherit! :search_paths
    product_pods
end
