stacks_raw, moves = File.new('aoc-5-input.txt').read.split("\n\n").map { |e| e.split("\n") }
stacks = stacks_raw.first(stacks_raw.size - 1).map { |e| e.chars.each_slice(4).to_a.map { |el| el[1] } }.reduce([]) { |acc, e| e.map.with_index { |el, i| acc[i] ||= []; acc[i] << el if el != ' ' } }.map(&:reverse)
p stacks
p moves
moves.map { |e| e.gsub(/move (\d+) from (\d) to (\d)/) { stacks[$3.to_i - 1] += stacks[$2.to_i - 1].pop($1.to_i) } }
p stacks.map(&:last).join