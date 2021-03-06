Gem::Specification.new do |s|
  s.name        = 'jekyll-diary'
  s.version     = '0.0.1'
  s.date        = '2014-08-25'
  s.summary     = "A Ruby CLI tool to help manage the process of creating drafts for your Jekyll blog and publishing them."
  s.description = "A Ruby CLI tool to help manage the process of creating drafts for your Jekyll blog and publishing them."
  s.authors     = ["Todd Grooms"]
  s.email       = 'todd.grooms@gmail.com'
  s.files       = ["lib/jekyll-diary.rb"]
  s.homepage    =
    'https://github.com/groomsy/jekyll-diary'
  s.license       = 'MIT'
  
  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end