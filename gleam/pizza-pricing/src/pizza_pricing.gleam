pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

fn pizza_price_rec(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita       -> acc + 7
    Caprese          -> acc + 9
    Formaggio        -> acc + 10
    ExtraSauce(p)    -> pizza_price_rec(p, acc + 1)
    ExtraToppings(p) -> pizza_price_rec(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [_]    -> order_price_rec(order, 3)
    [_, _] -> order_price_rec(order, 2)
    _      -> order_price_rec(order, 0)
  }
}

fn order_price_rec(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [p, ..rest] -> order_price_rec(rest, acc + pizza_price(p))
  }
}
