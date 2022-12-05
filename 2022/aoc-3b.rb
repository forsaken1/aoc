p File.new('aoc-3-input.txt').read.split("\n").each_slice(3).to_a.flat_map { |e| e[0].bytes & e[1].bytes & e[2].bytes }.map { |e| e > 90 ? e - 96 : e - 38  }.sum
