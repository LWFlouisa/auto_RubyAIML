require 'programr'

bot_name = "BIANCA" # This will refer to an external bot name later.
usr_name = "SARAH"  # This will refer to an external username later.

brains = Dir.glob("chatbots/*")

robot = ProgramR::Facade.new
robot.learn(brains)

while true
  print "#{usr_name }>> "
  s = STDIN.gets.chomp
  reaction = robot.get_reaction(s)
  STDOUT.puts "#{bot_name} << #{reaction}"
end
