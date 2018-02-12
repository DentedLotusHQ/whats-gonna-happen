Gem::Specification.new do |s|
  s.name = 'whats_gonna_happen'
  s.version = '0.0.1'
  s.summary = 'Whats Gonna Happen'
  s.description = 'An application that allows users to create groups, live events and predictions'

  s.authors = ['Dented Lotus']
  s.email = 'derrickplotsky@gmail.com'
  s.homepage = 'https://github.com/DentedLotusHQ/whats-gonna-happen'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'

  s.add_runtime_dependency 'eventide-postgres'
end