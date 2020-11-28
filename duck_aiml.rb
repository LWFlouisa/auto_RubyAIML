require "duck_duck_go"

print "What is your search query? >> "; request = gets.chomp

## Duck Duck Go Specifics
ddg = DuckDuckGo.new
zci = ddg.zeroclickinfo(request) # ZeroClickInfo object

header         = "What is a #{zci.heading}?"
definition     = zci.abstract_text
related_topics = zci.related_topics["_"][0].text

current_pattern = "#{header}"
current_template = "#{definition} #{related_topics}"

## Create a AIML body that appends the previous archive to the top.
old_pat_temp = File.read("archive/history/old_body.txt").strip

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

## Generates a chatbot from the search results.
open("chatbots/karizaki.aiml", "w") { |f|
  f.puts header
  f.puts body
  f.puts closer
}
