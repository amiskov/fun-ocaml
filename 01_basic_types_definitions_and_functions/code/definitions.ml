gg(* Global Definitions *)
let x = 2 + 3;;
let y = x + 5;;

let x = 42;; (* shadowing, previous x never change *)
print_int x;; (* 42 *)


(* Local (sequential) Definitions *)
let x = 2 in x + 3;; (* this x is visible only in `in` expression (the scope) *)
print_int x;; (* 42 *)

let z = 3 in z + 10;;
(* print_int z;; *) (* Error, `z` is local and not available in global scope *)

let z = let x = 4 in
          let y = x + 1 in
            let x = 2 * y in x;; (* inner x shadows outer x *)

print_string "\n";;
print_int z;; (* 10 *)


(* Simultaneous Definitions *)
let x = 3 and y = 4;;
print_int (x + y);;



(* Function Definition *)
let f x = x * 3;; (* global *)
print_string "\n";;
print_int (f (f 3));;
print_string "\n";;

let g x = x * 3 in g 10;; (* local *)
(* print_int (g 3);; *) (* error *)


(* Lexical Scoping *)
let f x = x + 1;;   (* для вызова g сработает эта функция f, *)
let g y = f (f y);;
let f x = 2 * x;;   (* а не эта, потому что в LS,
                      если в функции используется внешний байндинг,
                      то он закрепляется за ней при объявлении,
                      а не при выполнении. *)

print_int(g 5);; (* 7 : g 5 => f (f 5) => ((5 + 1) + 1) => 7 *)

print_string "\n";;
print_string "\n";;

(* Another example *)
let a = 1;;
let f x = x + a;;
print_int (f 2);; (* 3 *)
print_string "\n";;
let a = 73;;
print_int (f 2);; (* still 3 *)



