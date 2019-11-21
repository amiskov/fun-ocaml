(* Create an array *)
let p = [| 1; 2; 3 |]
let square x = x * x
let squares n = Array.init n square
let s1 = squares 5
let s2 = squares 10


(* Array Patterns *)
let swap a = [| a.(1); a.(0) |]
let a = [|0; 1|]
let b = swap a

(* Example of non exhaustive pattern:
   - empty array will fail
   - array with more than 2 elements will fail
*)
let swap' [| x; y |] = [| y; x |]
let a' = [| 0; 1 |]
let b' = swap' a'