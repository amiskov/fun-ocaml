let rec length = function
  | [] -> 0
  | x :: xs -> 1 + length xs;;

(* print_int (length [1;2;3]) *)

(* Reverses a list: O(n^2) *)
let rec rev_quadr = function
  | [] -> []
  | x :: xs -> rev_quadr xs @ [x];;


(* Reverses a list with accumulator: O(n) *)
let rec rev_aux acc = function
  | [] -> acc
  | x :: xs -> rev_aux (x :: acc) xs
;;

let rev_linear l = rev_aux [] l;;


let rec uniq = function
  | [] -> []
  | [x] -> [x]
  | x :: x' :: xs -> 
    if x = x' then
      uniq (x' :: xs)
    else
      x :: uniq (x' :: xs)
;;