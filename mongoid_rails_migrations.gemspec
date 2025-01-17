lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_rails_migrations/version'

Gem::Specification.new do |spec|
  spec.name        = 'mongoid_rails_migrations'
  spec.version     = MongoidRailsMigrations::VERSION
  spec.authors     = ['Alan Da Costa', 'Adrien Rey-Jarthon']
  spec.email      = ['alandacosta@gmail.com', 'jobs@adrienjarthon.com']

  spec.summary     = 'Data migrations for Mongoid.'
  spec.description = 'Data migrations for Mongoid in Active Record style, minus column input.'
  spec.homepage    = 'http://github.com/adacosta/mongoid_rails_migrations'
  spec.license     = 'MIT'

  spec.files         = Dir['README.rdoc', 'mongoid_rails_migrations.gemspec', 'lib/**/*']
  spec.require_paths = ['lib']

  rails_version = '>= 4.2.0'

  spec.add_runtime_dependency('bundler', '>= 1.0.0')
  # 9.0.0 broke client override isolation: https://jira.mongodb.org/browse/MONGOID-5815
  # got fixed in 9.0.3 so rejectings versions in between to prevent bad surprises:
  spec.add_runtime_dependency('mongoid', '>= 5.0.0', '!= 9.0.0', '!= 9.0.1', '!= 9.0.2')
  spec.add_runtime_dependency('rails',  rails_version)
  spec.add_runtime_dependency('railties',  rails_version)
  spec.add_runtime_dependency('activesupport',  rails_version)
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end
