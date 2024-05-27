class Minesweeper
  @@mine = '*'

  @board : Array(Array(Char))

  def initialize(board)
    @board = board.map &.chars
  end

  def annotate
    annotated_board = @board.clone

    @board.each_index do |r|
      @board[r].each_index do |c|
        if @board[r][c] != @@mine
          count = count_mines(r, c)
          annotated_board[r][c] = count.to_s[0] if count > 0
        end
      end
    end

    annotated_board.map &.join
  end

  private def count_mines(r, c)
    count = 0

    (-1..1).each do |dr|
      (-1..1).each do |dc|
        rr = r + dr
        cc = c + dc
        if rr >= 0 && rr < @board.size &&
           cc >= 0 && cc < @board[0].size &&
           @board[rr][cc] == @@mine
          count += 1
        end
      end
    end

    count
  end
end
