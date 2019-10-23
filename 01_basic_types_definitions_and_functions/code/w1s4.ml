(* Print Boolean Helper *)
let pb exp = Printf.printf "%B\n" (exp);;


let multiple_of n d =
  n mod d = 0;;

let integer_square_root n =
  int_of_float(sqrt (float_of_int n));;


pb (multiple_of 12 3);;
print_int (integer_square_root 17);;



let last_character str =
  String.get str ((String.length str) - 1);;

let string_of_bool truth =
  if truth then "true" else "false";;

print_endline "";;
print_char (last_character "test");;
print_endline "";;
print_string (string_of_bool true);;
print_string (string_of_bool false);;


print_endline "";;

let rec fact n =
  if (n <= 1) then 1 else n * fact(n - 1);;

print_int (fact 3);;
print_endline "";;
print_int (fact 5);;
print_endline "";;


(* Simultaneous Definitions for Mutual Recursion *)
let rec even x =
  if (x = 0) then true else (x > 0) && odd (x - 1)
and odd x = if x = 1 then true else x > 1 && even (x - 1);;

print_endline "";;
pb (odd 3);;

