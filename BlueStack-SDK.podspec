Pod::Spec.new do |spec|
  
  spec.name             = "BlueStack-SDK"
  spec.version          = "4.1.3"
  spec.summary          = "BlueStack by Madvertise provides functionalities for monetizing your mobile application"
  spec.description      = <<-DESC
                       BlueStack by Madvertise provides functionalities for monetizing your mobile application: from premium sales with reach media, video and innovative formats, it facilitates inserting native mobile ads as well all standard display formats. BlueStack SDK is a library that allow you to handle the following Ads servers with the easy way :
  Smart-Display-SDK
  FBAudienceNetwork
  Google-Mobile-Ads-SDK
  AmazonPublisherServicesSDK
  CriteoPublisherSdk
  OguryAds
  FlurryAds
  mopub-ios-sdk
  AdColony
   DESC
  spec.homepage         = "https://developers.madvertise.com/"
  spec.license          = 'Commercial'
  spec.author           = { "MadvertiseMedia" => "https://madvertise.com",
                         "Technical Assistance" => "tech@madvertise.com"
                       }

#  spec.source           = { :http => "https://bitbucket.org/mngcorp/mngads-demo-ios/downloads/BlueStack-SDK-v4.1.3.zip" }
  spec.source           = { :git => 'https://github.com/azerion/BlueStackSDK.git' , :tag => "v{spec.version}" }
  
  s.source_files = 'BlueStack-SDK-v4.1.3.zip'

#  spec.xcconfig        =  { 'LIBRARY_SEARCH_PATHS' => '"$(PODS_ROOT)/../../BlueStack-SDK"' , 'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/../../BlueStack-SDK"' }

  spec.platform = :ios
  spec.swift_version = "5"
  spec.ios.deployment_target  = '12.2'

  spec.frameworks = 'CoreGraphics', 'QuartzCore', 'SystemConfiguration', 'MediaPlayer', 'CoreMotion', 'EventKitUI', 'EventKit', 'AdSupport', 'StoreKit', 'CoreLocation', 'Accelerate', 'CoreTelephony', 'MessageUI'



 spec.default_subspec = 'Full'

  ###################################
  #######                     #######
  #######       subspecs      #######
  #######                     #######
  ###################################

  spec.subspec 'Core' do |mng|
    mng.vendored_frameworks = 'BlueStackSDK/BlueStackSDK.xcframework'
    mng.dependency 'BlueStack-SDK/OMSDKMadvertise'
  end

  spec.subspec 'OMSDKMadvertise' do |om|
    om.vendored_frameworks           = 'BlueStackSDK/OMSDK_Madvertise.xcframework'
  end

  spec.subspec 'FBAudienceNetwork' do |fb|
      fb.vendored_frameworks = 'BlueStackSDK/BlueStackFacebookAdapter.xcframework'
      fb.dependency 'FBAudienceNetwork', '6.9.0'
      fb.dependency 'BlueStack-SDK/Core'
  end


  spec.subspec 'Google-Mobile-Ads-SDK' do |dfp|
      dfp.vendored_frameworks = 'BlueStackSDK/BlueStackDFPAdapter.xcframework'
      dfp.dependency 'BlueStack-SDK/Core'
      dfp.dependency 'Google-Mobile-Ads-SDK','9.9.0'
  end

  spec.subspec 'Smart-Display-SDK' do |sas|
      sas.vendored_frameworks = 'BlueStackSDK/BlueStackSASAdapter.xcframework'
      sas.dependency 'BlueStack-SDK/Core'
      sas.dependency 'Smart-Display-SDK',  '~> 7.18.0'
      sas.dependency 'Smart-Core-SDK',  '~> 7.18.0'

  end

  spec.subspec 'AdColony' do |ac|
      ac.vendored_frameworks = 'BlueStackSDK/BlueStackAdColonyAdapter.xcframework'
      ac.dependency 'AdColony', '4.8.0'
      ac.dependency 'BlueStack-SDK/Core'
  end

  spec.subspec 'MAdvertiseLocation' do |mlo|
      mlo.vendored_frameworks = 'BlueStackSDK/BlueStackLocationAdapter.xcframework'
      mlo.dependency 'MAdvertiseLocation', '3.1.0'
      mlo.dependency 'BlueStack-SDK/Core'
  end

  spec.subspec 'AmazonPublisherServicesSDK' do |amazon|
      amazon.vendored_frameworks = 'BlueStackSDK/bluestackAmazonPublisherServicesAdapter.xcframework'
      amazon.dependency               'BlueStack-SDK/Core'
      amazon.dependency               'AmazonPublisherServicesSDK',  '4.5.1'
  end

 spec.subspec 'CriteoPublisherSdk' do |criteo|
       criteo.vendored_frameworks = 'BlueStackSDK/BluestackCriteoAdapter.xcframework'
       criteo.dependency               'CriteoPublisherSdk', '4.5.0'
       criteo.dependency               'BlueStack-SDK/Core'
  end

  spec.subspec 'OguryAds' do |og|
      og.vendored_frameworks = 'BlueStackSDK/BlueStackOguryAdapter.xcframework'
      og.dependency                'OgurySdk','2.1.0'
      og.dependency                'BlueStack-SDK/Core'
  end

  spec.subspec 'In-App-Bidding' do |inApp|
     inApp.dependency            'BlueStack-SDK/CriteoPublisherSdk'
     inApp.dependency            'BlueStack-SDK/Smart-Display-SDK'
     inApp.dependency            'BlueStack-SDK/AmazonPublisherServicesSDK'
     inApp.dependency            'BlueStack-SDK/Core'
     inApp.dependency            'BlueStack-SDK/FBAudienceNetwork'
  end

  spec.subspec 'Full' do |full|
    full.dependency              'BlueStack-SDK/Core'
    full.dependency              'BlueStack-SDK/Google-Mobile-Ads-SDK'
    full.dependency              'BlueStack-SDK/Smart-Display-SDK'
    full.dependency              'BlueStack-SDK/OguryAds'
    full.dependency              'BlueStack-SDK/In-App-Bidding'
  end

end