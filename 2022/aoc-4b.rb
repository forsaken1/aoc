def overlap? pair
  a, b = pair.first
  c, d = pair.last

  a <= c && c <= b || c <= a && a <= d
end

p File.new('aoc-4-input.txt').read.split("\n").map { |e| e.split(',').map { |el| el.split('-').map(&:to_i) } }.reduce(0) { |acc, e| acc + (overlap?(e) ? 1 : 0) }
p overlap?([[2, 4], [6, 8]])
p overlap?([[2, 8], [3, 7]])
p overlap?([[6, 6], [4, 6]])