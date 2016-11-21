Gem::Specification.new do |s|
    s.name          = 'kele'
    s.version       = '0.0.1'
    s.date          = '2016-11-20'
    s.summary       = 'Kele API Client'
    s.description   = 'A client for the Bloc API'
    s.authors       = '[Craig Schotch II]'
    s.email         = 'caschotchii@gmail.com'
    s.files         = 'git ls-files'.split($/)
    s.require_paths = ["lib"]
    s.homepage      = 'http://rubygems.org/gems/kele'
    s.license       = 'MIT'
    s.add_runtime_dependency 'httparty', '~> 0.13'
end