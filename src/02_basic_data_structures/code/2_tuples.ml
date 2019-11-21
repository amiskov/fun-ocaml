(* Example of types `(int * int)` *)
let origin = (0, 0);;
let x_positive_limit = (max_int, 0);;
let x_negative_limit = (min_int, 0);;


(* We can use user defined annotations for this: *)
type point2D = int * int;;
let origin : point2D = (0, 0);;
let x_positive_limit : point2D = (max_int, 0);;
let x_negative_limit : point2D = (min_int, 0);;




let a = (3 * 6, 4 * 6);;

(* Identifier `x` is the name of the first element of `a`: *)
let (x, _) = a;;
print_int x;; (* x = 18 *)
print_endline "";;

(* Pattern could be an argument of a function: *)
let abscissa (x, _) = x;; (* observe only `x` from given argument *)
let ordinate (_, y) = y;;

let x' = abscissa a;;
let y' = ordinate a;;

print_int x';; (* x' = 18 *)
print_endline "";;

print_int y';; (* y' = 24 *)
print_endline "";;



(* Print Boolean Helper *)
let pb exp = Printf.printf "%B\n" (exp);;

let p = (1, 2);;
let q = (1, 2);;
let p' = p;;

pb (p = q);;  (* true, the same values *)
pb (p == q);; (* false, not the same memory location *)
pb (p == p');; (* true, same memory location *)
