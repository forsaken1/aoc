p File.new('aoc-3-input.txt').read.split("\n").flat_map { |e| e[0...(e.size/2)].bytes & e[(e.size/2)..e.size].bytes }.map { |e| e > 90 ? e - 96 : e - 38  }.sum

# a-z 97 - 122
# A-Z 65 - 90