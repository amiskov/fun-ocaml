(* Helpers: print bool and tuple values *)
let pb exp = Printf.printf "%B\n" (exp);;
let pt (x, y) = Printf.printf "%d %d\n" x y;;

(* Flips digits in number k *)
let exchange (k) =
  (k mod 10) * 10 + k / 10;;

(* Returns true if puzzle is solved with given arguments *)
let is_valid_answer (grand_father_age, grand_son_age) =
  let gf_guess = grand_son_age * 4 in
  (gf_guess = grand_father_age) && ((exchange gf_guess) * 3
  = exchange grand_son_age);;

(* Checks all grand-son's ages *)
let find answer =
  let (max_gf, min_gs) = answer in
    let rec check_ages gs =
      let guess_gf = gs * 4 in
        if guess_gf > max_gf then (-1, -1)
        else
          if is_valid_answer(guess_gf, gs) then (guess_gf, gs)
          else check_ages (gs + 1) in
      check_ages min_gs;;

(* #trace find;; *)
(* pt (find (72, 15));; *)
