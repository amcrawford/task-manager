require 'rake/testtask'
require 'bundler'
Bundler.require

task :test do
  # finds and runs all files that end in test.rb
  Dir.glob('./test/**/*_test.rb') {|file| require file}
end
