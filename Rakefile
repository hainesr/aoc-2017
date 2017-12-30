#
# Advent of Code 2017
#
# Robert Haines
#
# Public Domain
#

require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.test_files = FileList['test/all-tests.rb']
  t.verbose = true
end

desc 'Run code for a day, or days, of advent of code'
task :run do
  ARGV[1..-1].each do |day|
    day = day.to_i
    next if day < 1 || day > 25
    puts "Advent of Code day #{day}"
    file = "%02d.rb" % day
    run = File.join(File.dirname(__FILE__), "bin", file)
    exec "ruby #{run}"
  end
  exit
end
