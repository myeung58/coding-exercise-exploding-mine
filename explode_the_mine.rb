Dir["models/*"].each { |file| require_relative file }

DEFAULT_FILE = "challenge.txt"

mines = File.open(ARGV[0] || DEFAULT_FILE).map do |line|
  mine_params = line.chomp.split(" ")
  Mine.new(mine_params[0], mine_params[1], mine_params[2])
end

MineExploder.new(mines).render
