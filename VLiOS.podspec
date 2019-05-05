Pod::Spec.new do |s|

    s.name                  = 'VLiOS'
    s.version               = '0.1'
    s.summary               = 'iOS client for identity verification layer.'
    s.homepage              = 'https://github.com/verifid/vl-ios'
    s.license               = {
        :type => 'MIT',
        :file => 'LICENSE'
    }
    s.author                = {
        'Abdullah Selek' => 'abdullahselek@gmail.com'
    }
    s.source                = {
        :git => 'https://github.com/verifid/vl-ios.git',
        :tag => s.version.to_s
    }
    s.ios.deployment_target = '11.0'
    s.source_files          = 'vl-ios/*.swift'
    s.requires_arc          = true
    s.swift_version         = '5.0'

end
