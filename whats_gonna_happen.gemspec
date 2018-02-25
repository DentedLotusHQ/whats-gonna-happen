

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'whats_gonna_happen'
  spec.version = '0.0.1'
  spec.summary = 'Whats Gonna Happen'
  spec.description = 'An application that allows users to create groups, live events and predictions'

  spec.authors = ['Dented Lotus']
  spec.email = 'derrickplotsky@gmail.com'
  spec.homepage = 'https://github.com/DentedLotusHQ/whats-gonna-happen'
  spec.licenses = ['MIT']

  spec.require_paths = ['lib']
  spec.files = Dir.glob('{lib}/**/*')
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.5.0'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end