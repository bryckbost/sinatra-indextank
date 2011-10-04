# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "sinatra-indextank"
  s.version     = "0.0.1"
  s.authors     = ["Brian Ryckbost"]
  s.email       = ["brian@collectiveidea.com"]
  s.homepage    = ""
  s.summary     = %q{A simple extension to sinatra for using IndexTank}
  s.description = %q{A simple extension to sinatra for using IndexTank}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "indextank"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rack-test"
end
