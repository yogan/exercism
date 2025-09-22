pub type Planet {
  Mercury
  Venus
  Earth
  Mars
  Jupiter
  Saturn
  Uranus
  Neptune
}

pub fn age(planet: Planet, seconds: Float) -> Float {
  case planet {
    Mercury -> seconds /. 0.2408467
    Venus -> seconds /. 0.61519726
    Earth -> seconds
    Mars -> seconds /. 1.8808158
    Jupiter -> seconds /. 11.862615
    Saturn -> seconds /. 29.447498
    Uranus -> seconds /. 84.016846
    Neptune -> seconds /. 164.79132
  }
  |> to_years
}

fn to_years(seconds: Float) -> Float {
  seconds /. 31_557_600.0
}
