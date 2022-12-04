SCORE = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

OUTCOME = {
  'A' => { 'X' => 3, 'Y' => 6, 'Z' => 0 },
  'B' => { 'X' => 0, 'Y' => 3, 'Z' => 6 },
  'C' => { 'X' => 6, 'Y' => 0, 'Z' => 3 }
}

p File.new('aoc-2-input.txt').read.split("\n").map { |e| e.split(" ") }.reduce(0) { |acc, e| acc + SCORE[e.last] + OUTCOME[e.first][e.last] }
