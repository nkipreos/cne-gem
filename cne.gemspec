Gem::Specification.new do |s|
  s.name = 'cne'
  s.version = '0.0.1'
  s.platform = Gem::Platform::RUBY
  s.authors = ['Nicolás Kipreos']
  s.email = ['nkipreos@gmail.com']
  s.homepage = 'http://github.com/nkipreos/'
  s.description = 'A Ruby Wrapper for the CNE API at energiaabierta.cl'
  s.summary = 'This is Ruby Wrapper for the API of the chilean National Energy Commission (CNE)'
  s.files = Dir.glob('{lib}/**/*') + %w(README.md cne.gemspec)
  s.require_path = 'lib'
end
