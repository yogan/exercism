func append<T>(_ list1: [T], _ list2: [T]) -> [T] {
    if list1.isEmpty {
        return list2
    }

    return list1[0...0] + append(Array(list1[1...]), list2)
}

func concat<T>(_ lists: [T]...) -> [T] {
    // variadic functions cannot be called with an array directly, and there
    // is no splat operator, so we have to delegate to a helper function
    // that takes an array, see https://stackoverflow.com/a/24024740/183582
    return concat(lists)
}

func concat<T>(_ listOfLists: [[T]])-> [T] {
    if listOfLists.isEmpty {
        return []
    }

    if listOfLists[0].isEmpty {
        return concat(Array(listOfLists[1...]))
    }

    let head: [T] = [listOfLists[0][0]]
    let rest: [T] = Array(listOfLists[0][1...])
    let restList: Array<[T]> = Array(listOfLists[1...])

    return head + concat([rest] + restList)
}

func filter<T>(_ list: [T], _ predicate: (T) -> Bool) -> [T] {
    if list.isEmpty {
        return []
    }

    if predicate(list[0]) {
        return [list[0]] + filter(Array(list[1...]), predicate)
    }

    return filter(Array(list[1...]), predicate)
}

func length<T>(_ list: [T]) -> Int {
    if list.isEmpty {
        return 0
    }

    return 1 + length(Array(list[1...]))
}

func map<T>(_ list: [T], _ op: (T) -> T) -> [T] {
    if list.isEmpty {
        return []
    }

    return [op(list[0])] + map(Array(list[1...]), op)
}

func foldLeft<T>(_ list: [T], accumulated acc: T, combine op: (T, T) -> T) -> T {
    if list.isEmpty {
        return acc
    }

    return foldLeft(Array(list[1...]), accumulated: op(acc, list[0]), combine: op)
}

func foldRight<T>(_ list: [T], accumulated acc: T, combine op: (T, T) -> T) -> T {
    if list.isEmpty {
        return acc
    }

    return op(list[0], foldRight(Array(list[1...]), accumulated: acc, combine: op))
}

func reverse<T>(_ list: [T]) -> [T] {
    return rev(list, [])
}

func rev<T>(_ list: [T], _ acc: [T]) -> [T] {
    if list.isEmpty {
        return acc
    }

    return rev(Array(list[1...]), [list[0]] + acc)
}
