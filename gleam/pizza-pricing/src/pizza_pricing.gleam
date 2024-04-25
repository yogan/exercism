pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order {
    [p] -> 3 + pizza_price(p)
    [p1, p2] -> 2 + pizza_price(p1) + pizza_price(p2)
    pizzas -> order_price_rec(pizzas, 0)
  }
}

fn order_price_rec(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [p, ..rest] -> order_price_rec(rest, acc + pizza_price(p))
  }
}
