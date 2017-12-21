require_relative 'lib/giphyrb'

Gem::Specification.new do |s|
  s.summary     = 'Giphy API wrapper'
  s.description = 'A simple Giphy API Wrapper'
  s.authors     = ['Whaxion']
  s.email       = ['whaxion@gmail.com']
  s.homepage    = 'http://github.com/whaxion/giphyrb'

  s.files     = `git ls-files`.split("\n")
  s.require_paths = ['lib']
  s.license     = 'MIT'

  s.name        = 'giphyrb'
  s.version     = GiphyRB::Giphy::VERSION
end