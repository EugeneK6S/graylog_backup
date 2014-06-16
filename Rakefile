require 'bundler/setup'
require 'rake'
require 'rspec/core/rake_task'
require 'foodcritic'


task :default => [:test]

RSpec::Core::RakeTask.new(:spec) do |s|
  s.rspec_opts = "../#{File.basename(Dir.getwd)}"
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['any']}
end

desc "Runs knife cookbook test against all the cookbooks."
task :knife_test do

  command = "knife cookbook test #{File.basename(Dir.getwd)} -o #{File.expand_path("..",Dir.pwd)}"
  if ENV.has_key?("KNIFE_FILE") then
     command=command + " -c " +  ENV['KNIFE_FILE']      
  end  
  sh command
end


desc "Starts vagrant and runs minitest"
task :vmstart do
  sh "vagrant up --destroy-on-error"
end

desc "Stops vagrant"
task :vmstop do
  sh "vagrant destroy -f"
end


desc "Run unit tests"
task :test do
  [ :knife_test, :foodcritic, :spec ].each do |task|
    Rake::Task[task].execute
   end
 end

desc "Run integration tests"
task :test_int do
  [ :vmstart, :vmstop ].each do |task|
    Rake::Task[task].execute
  end
end

desc "Run tests kitchen"
task :test_kitchen do
  sh  "kitchen test"
end




