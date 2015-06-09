class MineField
  attr_reader :exploded_quantity

  def initialize(mines)
    @mines = mines.map &:reset
    @exploded_quantity = 0
  end

  def set_off(mine)
    return unless mine.explode
    update_mine_field_status
    within_radius_of(mine).each { |mine| set_off mine }
  end

  def update_mine_field_status
    @exploded_quantity += 1
  end

  def within_radius_of(mine)
    @mines.select do |other_mine|
      next if mine == other_mine || other_mine.exploded
      within_radius? mine, other_mine
    end
  end

  def within_radius?(mine1, mine2)
    return unless mine1 && mine2
    ((mine1.x - mine2.x) ** 2  +  (mine1.y - mine2.y) ** 2) <= (mine1.blast_radius ** 2)
  end

  def reset
    @mines = @mines.map &:reset
    @exploded_quantity = 0
  end
end
