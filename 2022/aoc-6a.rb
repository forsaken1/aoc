def run
  arr = File.new('aoc-6-input.txt').read.chars
  arr.map.with_index do |e, i|
    subarr = arr[i + 1..i + 13]
    return i + 14 if subarr.uniq.size == 13 && !subarr.include?(e)
  end
end

p run
