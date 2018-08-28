#
# Be sure to run `pod lib lint EthereumUnitSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EthereumUnitSwift'
  s.version          = '0.1.0'
  s.summary          = 'Ethereum unit conversion for Swift'
  s.homepage         = 'https://github.com/anchorpw/ethereum-unit-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ne0nx' => 'd.karachentsov@gmail.com' }
  s.source           = { :git => 'https://github.com/anchorpw/ethereum-unit-swift', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'EthereumUnitSwift/Classes/**/*'
  s.dependency 'BigInt', '~> 3.1'
end
