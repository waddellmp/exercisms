module Port
  IDENTIFIER = :PALE
  def self.get_identifier(city)
    raise 'Please implement the Port.get_identifier method'
  end

  def self.get_terminal(ship_identifier)
    raise 'Please implement the Port.get_terminal method'
  end

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(id)
    # Extract the cargo from the identifier
    cargo = id.to_s[0..2]
    case cargo
    when "OIL", "GAS"
      :A
    else
      :B
    end
  end
end
