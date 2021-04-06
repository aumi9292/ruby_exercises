require 'erb'

template = ERB.new %q{Chunky <%= food %>!}
food = "bacon"
p template.result
