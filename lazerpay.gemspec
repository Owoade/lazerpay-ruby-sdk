lib = File.expand_path('../lib', __FILE__);
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib);


Gem::Specification.new do |spec|
    spec.name          = "lazerpay"
    spec.version       = "0.0.3"
    spec.authors       = ["Owoade Anuoluwapo"]
    spec.email         = ["owoadeanuoluwapo2@gmail.com"]
    spec.homepage      = "https://github.com/Owoade/lazerpay-ruby-sdk"
    spec.license       = "MIT"
    spec.files         = Dir['lib/**/*.rb']
    spec.summary       = "Ruby SDK for Lazerpay finance"

    # Dependencies
    spec.add_development_dependency "rake", "~> 10.0"
    spec.add_runtime_dependency  'httparty', '~> 0.21.0'
    spec.required_ruby_version = '>= 2.0.0'
   
end