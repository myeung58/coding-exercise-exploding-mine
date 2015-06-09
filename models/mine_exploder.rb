class MineExploder
  def initialize mines
    @mines = mines
    @max_exploding_quantity = 0
    @result = []
    @mine_field = MineField.new mines
  end

  def render
    prepare_result
    render_result
  end

  private
  def prepare_result
    @mines.each do |mine|
      @mine_field.set_off mine
      update_result_with mine
      @mine_field.reset
    end
  end

  def render_result
    puts @max_exploding_quantity
    @result.each { |mine| puts "#{mine.x} #{mine.y}" }
  end

  def update_result_with(mine)
    if can_update_maximum
      @max_exploding_quantity = @mine_field.exploded_quantity
      @result = [mine]
    elsif same_as_maximum
      @result << mine
    end
  end

  def can_update_maximum
    @mine_field.exploded_quantity > @max_exploding_quantity
  end

  def same_as_maximum
    @mine_field.exploded_quantity == @max_exploding_quantity
  end
end
