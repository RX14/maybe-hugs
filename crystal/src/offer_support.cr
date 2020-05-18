require "option_parser"
require "./maybe_hugs"

name = nil
accepts_hugs = true
wants_to_talk = true

OptionParser.parse do |parser|
  parser.banner = "Usage: offer_support [options] name"
  parser.on("--no-hugs", "The cutie doesn't accept hugs") { accepts_hugs = false }
  parser.on("--no-talk", "The cutie doesn't want to talk right now") { wants_to_talk = false }
  parser.on("-h", "--help", "Show this help") do
    STDERR.puts parser
    exit
  end
end

name = ARGV[0]?
abort("No name specified") unless name

cutie = Person.new(name, accepts_hugs, wants_to_talk)
puts cutie.offer_support
