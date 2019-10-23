let a = [| 10; 12; 2; 3; 4; 0 |];;

let min arr =
  let rec min_inner min_val next_idx =
    if
      next_idx = (Array.length arr - 1)
    then
      min_val
    else
      let min_val = if min_val <= arr.(next_idx + 1) then min_val else arr.(next_idx + 1)
    in
      min_inner (min min_val arr.(next_idx + 1)) (next_idx + 1)
  in
    min_inner arr.(0) 0;;

(* #trace min;;
print_int (min a);;
 *)

let min_index arr =
  let rec min_inner min_val min_idx next_idx =
    if
      next_idx = Array.length arr
    then
      min_idx
    else
      let next_val = arr.(next_idx) in
      let min_val' = if min_val <= next_val then min_val else next_val in
      let min_idx = if (min_val <= min_val') then min_idx else next_idx in

      min_inner min_val' min_idx (next_idx + 1)
  in
    min_inner arr.(0) 0 0;;

#trace min_index;;
print_int (min_index a);;