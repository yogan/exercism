import gleam/bit_array
import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  list.fold(dna, <<0:0>>, fn(acc, n) { <<acc:bits, encode_nucleotide(n):2>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case bit_array.bit_size(dna) {
    s if s == 0 -> Ok([])
    s if s >= 2 -> {
      let assert <<val:2, rest:bits>> = dna
      let assert Ok(n) = decode_nucleotide(val)
      case decode(rest) {
        Ok(ns) -> Ok([n, ..ns])
        err -> err
      }
    }
    _ -> Error(Nil)
  }
}
