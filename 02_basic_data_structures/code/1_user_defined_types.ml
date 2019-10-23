(* type abbreviation `color` is represented as an integer *)
type color = int;;

(* Come bindings using `color` type *)
let red   : color = 0;;
let white : color = 1;;
let blue  : color = 2;;


type positive = int;;

(* Turns a positive or negative integer into a positive integer *)

(* int -> positive *)
(* Type assigned to subexpression if/else *)
let abs (x : int) = (if x < 0 then -x else x : positive);;

(* Same: int -> positive *)
(* But type assigned for the return value of a function *)
let abs' (x : int) : positive = if x < 0 then -x else x;;




type a, b = int;;