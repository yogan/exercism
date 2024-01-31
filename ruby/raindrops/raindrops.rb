class Raindrops
  def self.convert(n)
    result = { Pling: 3, Plang: 5, Plong: 7}
      .map { |w,d| n % d == 0 ? w.to_s : "" }
      .join("")

    result == "" ? n.to_s : result
  end
end
