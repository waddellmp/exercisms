module Tournament
  FORMAT = "%-31s|%3s |%3s |%3s |%3s |%3s"
  HEADER = sprintf(FORMAT, *%w(Team MP W D L P)) + "\n"

  def self.tally input
    stats = {}
    input.split("\n").each do |line|
      # Create array of [team, team, result] from line
      team1, team2, result = line.split(";")

      # Create team in stats hash if it doesn't exist
      stats[team1] = {matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0} if stats[team1].nil?
      stats[team2] = {matches_played: 0, wins: 0, draws: 0, losses: 0, points: 0} if stats[team2].nil?

      # Increment matches_played for each team
      stats[team1][:matches_played] += 1
      stats[team2][:matches_played] += 1

      # Update stats for each team
      case result
      when "win"
        stats[team1][:wins] += 1
        stats[team2][:losses] += 1
      when "draw"
        stats[team1][:draws] += 1
        stats[team2][:draws] += 1
      when "loss"
        stats[team1][:losses] += 1
        stats[team2][:wins] += 1
      end
    end

    # Calculate points for each team (win=3, draw=1, loss=0)
    stats.each do |team, stats|
      stats[:points] = (stats[:wins] * 3 + stats[:draws])
    end

    # Sort teams by points in descending order using the hash
    sorted_stats = stats.sort_by { |team, stats| [-stats[:points], team] }

    # Create table string
    table = HEADER

    sorted_stats.each do |team, stats|
      table += sprintf(FORMAT, team, stats[:matches_played].to_s, stats[:wins].to_s, stats[:draws].to_s, stats[:losses].to_s, stats[:points].to_s)
      table << "\n"
    end

    return table
    end
  end

# puts Tournament.tally "Allegoric Alaskans;Blithering Badgers;win
# Devastating Donkeys;Courageous Californians;draw
# Devastating Donkeys;Allegoric Alaskans;win
# Courageous Californians;Blithering Badgers;loss
# Blithering Badgers;Devastating Donkeys;loss
# Allegoric Alaskans;Courageous Californians;win"

# Team                           | MP |  W |  D |  L |  P
# Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
# Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
# Blithering Badgers             |  3 |  1 |  0 |  2 |  3
# Courageous Californians        |  3 |  0 |  1 |  2 |  1
