module Blackjack
  CARDS = {
    ace: 11,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 10,
    queen: 10,
    king: 10,
    other: 0,
  }
  SCORE_RANGES = {
      low: 4..11,
      middle: 12..16,
      high: 17..20,
      blackjack: 21,
      bust: 22..,
  }

  def self.parse_card(card)
    card_sym = card.to_sym
   case card_sym
   when :ace then 11
   when :two then 2
   when :three then 3
   when :four then 4
   when :five then 5
   when :six then 6
   when :seven then 7
   when :eight then 8
   when :nine then 9
   when :ten then 10
   when :jack then 10
   when :queen then 10
   when :king then 10
   when :other then 0
   else
    0
   end 
  end

  def self.card_range(card1, card2)
    card_score_int = parse_card(card1) + parse_card(card2)
    case card_score_int
    when SCORE_RANGES[:blackjack] then "blackjack"
    when SCORE_RANGES[:high] then "high"
    when SCORE_RANGES[:middle] then "mid"
    when SCORE_RANGES[:low] then "low"
    when SCORE_RANGES[:bust] then "bust"
    else
      raise "Invalid card score"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    range = card_range(card1, card2)
    case
    when card1 === "ace" && card2 === "ace" then "P"
    when range === "blackjack"
      return "W" unless face_card(dealer_card) || dealer_card === "ten" || dealer_card === "ace"
      "S"
    when range === "high" then "S"
    when range === "bust" then "S"
    when range === "mid"
      return "S" unless parse_card(dealer_card) >= 7
      "H"
    when range === "low" then "H"
    else
      raise "Invalid card range"
    end
  end

  def self.face_card(card)
    card === "jack" || card === "queen" || card === "king"
  end
end
