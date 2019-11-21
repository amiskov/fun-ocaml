(* Print Boolean Helper *)
let pb exp = Printf.printf "%B\n" (exp);;
let pt (x, y) = Printf.printf "%d %d\n" x y;;

(* Flips digits in number k *)
let exchange (k : int) : int =
  (k mod 10) * 10 + k/10;;

(* Returns true if puzzle is solved with arguments *)
let is_valid_answer (grand_father_age, grand_son_age) =
  let gf_guess = grand_son_age * 4
    in (gf_guess = grand_father_age) && ((exchange gf_guess) * 3 = exchange grand_son_age);;


(* Iterates over all grand-sons's ages *)
let rec iterate_gs (f, s) =
  if is_valid_answer (f, s) then (f, s)
  else
    if f > s then iterate_gs (f, (s + 1))
    else (-1, -1);;

(* Iterates over all grand-father's ages *)
let rec iterate_gf (f, s) =
  if is_valid_answer (f, s) then (f, s)
    else
      if f > s then iterate_gf ((f - 1), s)
      else (-1, -1);;

let rec find answer =
  let (f, s) = answer in
  if f <= s then (-1, -1)
  else
    let f_answer = iterate_gf answer in
    if f_answer <> (-1, -1) then f_answer
    else
      let s_answer = iterate_gs answer in
      if s_answer <> (-1, -1) then s_answer
      else find ((f - 1), (s + 1));;

(* #trace iterate_gf;; *)
(* #trace iterate_gs;; *)
(* #trace find;; *)
(* pt (find (74, 11));; *)
(* pt (find (99, 24));; *)
(* pt (find (99, 10));; *)
(* pt (find (77, 25));; *)
(* pt (find (80, 12));; *)
(* pt (find (79, 27));; *)
(* pt (find (71, 17));; *)
(* pt (find (95, 22));; *)
(* pt (find (92, 38));; *)
(* pt (find (66, 11));; *)
