Gem::Specification.new do |s|
  s.name        = 'diablo3-simple'
  s.version     = '0.0.2'
  s.date        = '2012-08-12'
  s.summary     = "A ruby gem to fetch Diablo 3 game information based on the server and battletag."
  s.description = "The main goal is to provide a simple class that fetches Diablo3 information using Blizzard's official API."
  s.authors     = ["Rodolfo Sikora"]
  s.email       = 'sikora@gmail.com'
  s.files       = ["lib/diablo3-simple.rb", "lib/D3/hero.rb"]
  s.homepage    = 'http://rubygems.org/gems/diablo3-simple'
  s.add_dependency('json', '>=1.6.6')
end
