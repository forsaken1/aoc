def contains? pair
  a, b = pair.first
  c, d = pair.last

  a <= c && d <= b || c <= a && b <= d
end

p File.new('aoc-4-input.txt').read.split("\n").map { |e| e.split(',').map { |el| el.split('-').map(&:to_i) } }.reduce(0) { |acc, e| acc + (contains?(e) ? 1 : 0) }
p contains?([[2, 4], [6, 8]])
p contains?([[2, 8], [3, 7]])
p contains?([[6, 6], [4, 6]])