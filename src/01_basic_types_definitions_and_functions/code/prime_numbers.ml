(* `gcd` that takes two non-negative integers `n` and `m`,
and that returns the greatest common divisor of `n` and `m`,
following Euclid's algorithm. *)

let rec gcd n m =
  if n = m then n
  else
    if n > m then gcd (n - m) m
    else gcd (m - n) n;;


let rec gcd_fast n m =
  if m = 0 then n
  else gcd_fast m (n mod m);;

(* #trace gcd_fast;; *)
(* print_int (gcd_fast 1071 462);; *)


(* `multiple_upto : int -> int -> bool` that takes two non-negative integers
`n` and `r`, and that tells whether `n` admits at least one divisor between
`2` and `r`, inclusive.

In other words that there exists a number `d >= 2` and `<= r`, such that
the remainder of the division of n by d is zero. *)

let rec multiple_upto n r =
  if (r < 2) then false
    else
      if ((n mod r) = 0) then true
      else multiple_upto n (r - 1);;

(* Print Boolean Helper *)
let pb exp = Printf.printf "%B\n" (exp);;

(* #trace multiple_upto;; *)
(* pb (multiple_upto 5 2);; *)


(* `is_prime` a takes a non-negative integer n and checks whether it is
a prime number. *)

(* от 2 до n/2 *)
let rec is_prime n =
  let rec check_prime n i =
    if i = 1 then true
    else
      if (n = 1) || ((n mod i) = 0) then false
      else check_prime n (i - 1)
  in
    check_prime n (n / 2);;

#trace is_prime;;
(* pb (is_prime 17);; *)
pb (is_prime 1);;

