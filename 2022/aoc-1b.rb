p File.read('aoc-1-input.txt').split("\n\n").map { |e| e.split("\n").map(&:to_i).sum }.sort.last(3).sum
