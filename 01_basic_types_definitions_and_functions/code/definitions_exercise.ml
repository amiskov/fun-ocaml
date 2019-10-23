(* Suppose that a variable x exists and is an integer.

Define a variable `x_power_8` that uses three multiplications
to calculate x to the power of 8.

The only function you are allowed to call is the `*` operator. *)

let x = Random.int 9 + 1 (* not 0 *)
(* let x = 2;; *)

let x_power_8 =
  let x2 = x * x in
    let x4 = x2 * x2 in
      let x8 = x4 * x4 in x8;;

print_int x_power_8;;



(* Suppose that a variable `word` exists and is a string.

Define a variable `sentence` that uses 5 string concatenations to create
a string containing 9 times `word`, separated by commas (',').

This time, experiment with defining local `let ... in`s
to store the partial results. *)

let word = "hello";;

let sentence =
  let sentence1 = word ^ "," in
    let sentence2 = sentence1 ^ sentence1 in
      let sentence4 = sentence2 ^ sentence2 in
        let sentence8 = sentence4 ^ sentence4 in
          let sentence9 = sentence8 ^ word in sentence9;;

print_string sentence;;

