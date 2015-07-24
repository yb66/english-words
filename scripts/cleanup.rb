# This script makes sure that each entry is unique and lowercase.

require 'pathname'

DEFAULT_DATA = Pathname(__dir__).join("../words3.txt")

data = ARGV[0] && Pathname(ARGV[0]) || DEFAULT_DATA

xs = IO.readlines(data.realpath);
ys = xs.sort
        .map(&:chomp)
        .map(&:downcase)
        .inject([]){|mem,obj|
          mem.last == obj ?
            mem :
            mem << obj
        }

IO.write(data.realpath, ys.join("\n"))