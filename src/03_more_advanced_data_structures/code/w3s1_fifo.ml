type queue = int list * int list

let is_empty (front, back) = match (front, back) with
  | ([], []) -> true
  | _ -> false
;;

let enqueue x (front, back) =
  (front, x :: back)
;;

let rec split_aux acc = function
  | [] -> acc
  | x :: xs ->
    let (front, back) = acc in
    if List.length back <= List.length xs
    then
      split_aux (front, back @ [x]) xs
    else
      split_aux (x :: front, back) xs
;;

let split l = split_aux ([], []) l;;

let dequeue (front, back) = match (front, back) with
  | (x :: xs, back) -> (x, (xs, back))
  | ([], back) -> let (x, rest) = match (List.rev back) with
      | [] -> (-1, [])
      | x :: xs -> (x, (List.rev xs))
    in
    (x, ([], rest))
;;

