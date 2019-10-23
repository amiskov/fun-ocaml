let unsorted = [| "hello"; "apple"; "tree"; "next" |]
let sorted   = [| "apple"; "hello"; "next"; "tree" |]

let sort_copy_of arr =
  let get_el arr i = arr.(i) in
  let arr' = Array.init (Array.length arr) (get_el arr) in
  Array.sort String.compare arr'; arr'

let is_sorted a =
  let s = sort_copy_of a in
  s = a

let find dict word =
  let rec bin_search min_idx max_idx =
    if min_idx <= max_idx then
      let guess_idx = (min_idx + max_idx) / 2 in
      let guess_word = dict.(guess_idx) in
      match String.compare guess_word word with
      |  1 -> bin_search min_idx (guess_idx - 1)
      | -1 -> bin_search (guess_idx + 1) max_idx 
      |  _ -> guess_idx 
    else (-1)
  in
  bin_search 0 (Array.length dict - 1)
