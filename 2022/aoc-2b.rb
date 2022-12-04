SCORE = {
  'X' => 0,
  'Y' => 3,
  'Z' => 6
}

OUTCOME = {
  'A' => { 'X' => 3, 'Y' => 1, 'Z' => 2 },
  'B' => { 'X' => 1, 'Y' => 2, 'Z' => 3 },
  'C' => { 'X' => 2, 'Y' => 3, 'Z' => 1 }
}

p File.new('aoc-2-input.txt').read.split("\n").map { |e| e.split(" ") }.reduce(0) { |acc, e| acc + SCORE[e.last] + OUTCOME[e.first][e.last] }

p SCORE['Y'] + OUTCOME['A']['Y']
p SCORE['X'] + OUTCOME['B']['X']
p SCORE['Z'] + OUTCOME['C']['Z']

p SCORE['Y'] + OUTCOME['A']['Y'] == 4
p SCORE['X'] + OUTCOME['B']['X'] == 1
p SCORE['Z'] + OUTCOME['C']['Z'] == 7