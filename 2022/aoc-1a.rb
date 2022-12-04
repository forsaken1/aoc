text = File.read 'aoc-1-input.txt'

answer = text.split("\n\n").map { |e| e.split("\n").map(&:to_i).sum }.max

p answer
