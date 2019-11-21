type index = Index of int

let read a index = match index with
  | Index index -> a.(index);;

let inside a index = match index with
  | Index index -> (index < (Array.length a) && index >= 0);;

let next index = match index with
  | Index index -> Index (index + 1);;

let min_index a =
  let rec aux min_val min_idx next_idx =
    if next_idx = Array.length a then Index min_idx
    else
      let next_val = a.(next_idx) in
      let min_val' = if min_val <= next_val then min_val else next_val in
      let min_idx = if (min_val <= min_val') then min_idx else next_idx in
      aux min_val' min_idx (next_idx + 1) in
  aux a.(0) 0 0;;


let idx = Index 1;;
let arr = [| 1; 2; 3 |];;
