number = File.read("data/number/input.txt").strip.to_i

if number > 4
  number = 0
end

old_pat_temp = File.read("archive/history/old_body.txt").strip

pattern  = File.readlines("patterns/input/dialogue.txt")
template = File.readlines("templates/input/dialogue.txt")

current_pattern  = pattern[number].strip
current_template = template[number].strip

header = '<aiml version="1.0.1" encoding="UTF-8">'
body   = "  #{old_pat_temp}

  <category>
    <pattern>#{current_pattern}</pattern>
    <template>#{current_template}</template>
  </category>
"
closer = "</aiml>"

# An archive of the previous pattern and template.
open("archive/history/old_body.txt", "w") { |f|
  f.puts body
}

open("chatbots/karizaki.aiml", "w") { |f|
  f.puts header
  f.puts body
  f.puts closer
}

number = number + 1

open("data/number/input.txt", "w") { |f|
  f.puts number
}
