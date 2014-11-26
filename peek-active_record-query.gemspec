# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'peek-active_record-query/version'

Gem::Specification.new do |spec|
  spec.name = 'peek-active_record-query'
  spec.version = Peek::ActiveRecordQuery::VERSION
  spec.authors = ['Jonah Williams']
  spec.email = ['jonah.williams@zalambar.com']
  spec.summary = %q{Display Active Record stats in Peek}
  spec.description = <<-DESC_END
    Uses Active Support notification to monitor queries and displays the queries
    per request and total query duration in Peek. Full request query logs are
    loaded in 'window.active_record_query' and listed in the browser console if
    available.
  DESC_END
  spec.homepage = 'https://github.com/jonah-williams/peek-active_record-query'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'peek', '>= 0.1.0'
  spec.add_dependency 'activerecord'
  spec.add_dependency 'atomic'
  spec.add_dependency 'thread_safe'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
