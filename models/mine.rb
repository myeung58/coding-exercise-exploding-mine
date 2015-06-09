class Mine
  attr_accessor :x, :y, :blast_radius, :exploded

  def initialize(x, y, blast_radius)
    @x = x.to_i
    @y = y.to_i
    @blast_radius = blast_radius.to_i
    @exploded = false
  end

  def explode
    return if exploded
    @exploded = true
  end

  def location
    [x, y]
  end

  def reset
    self.tap { |m| m.exploded = false }
  end
end
