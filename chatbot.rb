# require 'bundler'
# Bundler.setup :default

require 'programr'

#if ARGV.empty?
#  puts 'Please pass a list of AIMLs and/or directories as parameters'
#  puts 'Usage: ruby programr_test.rb {aimlfile|dir}[{aimlfile|dir}]...'
#  exit
#end
#
#robot = ProgramR::Facade.new
#robot.learn(ARGV)

brains = Dir.glob("chatbots/*")

robot = ProgramR::Facade.new
robot.learn(brains)

while true
  print '>> '
  s = STDIN.gets.chomp
  reaction = robot.get_reaction(s)
  STDOUT.puts "<< #{reaction}"
end
