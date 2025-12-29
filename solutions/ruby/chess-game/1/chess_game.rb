module Chess
  RANKS = (1..8)
  FILES = ('A'..'H')

  # Checks if a given rank and file combination represents a valid square on a chess board.
  # @param rank [Integer] The rank (row) number, should be between 1 and 8
  # @param file [String] The file (column) letter, should be between 'A' and 'H'
  # @return [Boolean] true if the square is valid, false otherwise
  def self.valid_square?(rank, file)
    unless RANKS.include?(rank) && FILES.include?(file)
      return false
    end
    true
  end

  # Generates a nickname for a player based on their first and last name.
  # @param first_name [String] The player's first name
  # @param last_name [String] The player's last name
  # @return [String] A nickname consisting of the first two letters of the first name and the last two letters of the last name
  def self.nickname(first_name, last_name)
    "#{first_name[0..1]}#{last_name[-2..]}".upcase
  end

  # Generates a message for a player's move on a chess board.
  # @param first_name [String] The player's first name
  # @param last_name [String] The player's last name
  # @param square [String] The square on the chess board where the player moved their piece
  # @return [String] A message indicating the player's nickname and their move
  def self.move_message(first_name, last_name, square)
    nickname = nickname(first_name, last_name)
    
    # Parse square like "A2" into rank (2) and file ('A')
    file = square[0]
    rank = square[1..-1].to_i
    
    unless valid_square?(rank, file)
      return "#{nickname} attempted to move to #{square}, but that is not a valid square"
    end
    "#{nickname} moved to #{square}"
  end
end
