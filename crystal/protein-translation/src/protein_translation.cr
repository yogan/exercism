module ProteinTranslation
  def self.proteins(strand : String) : Array(String)
    get_codons(strand)
      .take_while { |codon| !self.stop?(codon) }
      .map { |codon| self.translate(codon) }
  end

  private def self.get_codons(strand : String) : Array(String)
    strand
      .chars
      .in_slices_of(3)
      .map(&.join())
  end

  private def self.stop?(codon : String) : Bool
    codon.in?(["UAA", "UAG", "UGA"])
  end

  private def self.translate(codon : String) : String
    case codon
    when "AUG"                      then "Methionine"
    when "UUU", "UUC"               then "Phenylalanine"
    when "UUA", "UUG"               then "Leucine"
    when "UCU", "UCC", "UCA", "UCG" then "Serine"
    when "UAU", "UAC"               then "Tyrosine"
    when "UGU", "UGC"               then "Cysteine"
    when "UGG"                      then "Tryptophan"
    else raise ArgumentError.new("invalid codon " + codon)
    end
  end
end
