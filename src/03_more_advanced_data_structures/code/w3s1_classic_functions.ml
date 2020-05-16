let rec mem x l = match l with
  | [] -> false
  | x' :: xs -> if x = x' then true else mem x xs

let rec append l1 l2 = match l1 with
  | [] -> l2
  | x :: xs -> x :: (append xs l2)

let rec combine l1 l2 = match (l1, l2) with
  | ([], []) -> []
  | ([], ys) -> combine [] ys
  | (xs, []) -> combine xs []
  | (x :: xs, y :: ys) -> (x, y) :: combine xs ys

let rec assoc l k = match l with
  | [] -> None
  | (s, i) :: xs -> if s = k then Some i else assoc xs k
