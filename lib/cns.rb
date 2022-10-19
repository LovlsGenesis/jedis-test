module Cns
  def self.begin_number12(cns)
    pis = cns[0, 11]
    cns_to_array = pis.split('').map(&:to_i)
    soma = cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end

    resto = soma % 11
    dv = resto.zero? ? 0 : 11 - resto
    resultado = dv == 10 ? "#{pis}001#{11 - ((soma + 2) % 11)}" : "#{pis}000#{dv}"
    return false unless resultado == cns

    true
  end

  def self.begin_number789(cns)
    cns_to_array = cns.split('').map(&:to_i)
    soma = cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
      sum += element * (15 - index)
      sum
    end

    resto = soma % 11
    return false unless resto.zero?

    true
  end

  def self.validate(cns)
    return false if cns.length != 15

    begin_number = cns[0, 1].to_i

    if [1, 2].include?(begin_number)
      self.begin_number12(cns)
    elsif [7, 8, 9].include?(begin_number)
      self.begin_number789(cns)
    end
  end
end
