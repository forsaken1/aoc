class Interpretator
  attr_reader :lines

  def initialize(lines)
    @lines = lines
    @current_line_index = 0
    @dirs = {}
    @current_dir = nil
    @pwd = ''
    @debug = false
  end

  def run
    while not_end
      p current_line if @debug
      process_command
    end
    size = calc_sizes '/'
    p "Size: #{size}" if @debug
  end

  def answer
    @dirs.values.map { |e| e[:size] }.select { |e| e < 100_000 }.sum
  end

  def answer2
    max = 70000000
    all = @dirs['/'][:size]
    required =  30000000 - (max - all)
    @dirs.values.map { |e| e[:size] }.sort.find { |e| e > required }
  end

  private

  def process_command
    _, command, arg = current_line.split(' ')
    case command
    when 'cd'
      cd(arg)
    when 'ls'
      ls
    else
      p "Unexpected: #{command} #{arg}"
    end
  end

  def cd(dir)
    if dir == '..'
      @pwd = @pwd.split('/')[0..-2].join('/')
      next_line
      return
    end

    if dir == '/'
      @pwd = '/'
    else
      @pwd += '/' unless @pwd == '/'
      @pwd += dir
    end
    @dirs[@pwd] ||= { name: @pwd, size: 0, files: [], dirs: [] }
    @current_dir = @pwd
    next_line
  end

  def path(dir)
    @pwd == '/' ? "/#{dir}" : "#{@pwd}/#{dir}"
  end

  def ls
    next_line
    while not_end && !command?
      size, name = current_line.split(' ')
      if dir?
        current_dir[:dirs] << path(name)
      else
        current_dir[:files] << { name:, size: size.to_i }
      end
      p current_line if @debug
      next_line
    end
  end

  def command?
    current_line[0] == '$'
  end

  def dir?
    current_line[0..2] == 'dir'
  end

  def not_end
    @current_line_index < lines.size
  end

  def next_line
    @current_line_index += 1
  end

  def current_line
    lines[@current_line_index]
  end

  def current_dir
    @dirs[@current_dir]
  end

  def calc_sizes(dir_name)
    dir = @dirs[dir_name]
    dirs_size = dir[:dirs].map { |e| calc_sizes(e) }.sum
    size = dirs_size + dir[:files].map { |e| e[:size] }.sum
    dir[:size] = size
    size
  end
end

lines = File.new('aoc-7-input.txt').read.split("\n")
interpretator = Interpretator.new(lines)
interpretator.run
p interpretator.answer2
