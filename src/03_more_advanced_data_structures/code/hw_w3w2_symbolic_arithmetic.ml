type exp =
  | EInt of int
  | EAdd of exp * exp
  | EMul of exp * exp

(* 1 + 2 * 3 *)
let example =
  EAdd (EInt 1, EMul (EInt 2, EInt 3))

(*   (2 * 2) + (3 * 3)   *)
let my_example =
  EAdd ( (EMul (EInt 2, EInt 2)),
         (EMul (EInt 3, EInt 3)) )
;;

let rec eval e = match e with
  | EInt e -> e
  | EMul (e1, e2) -> (eval e1) * (eval e2)
  | EAdd (e1, e2) -> (eval e1) + (eval e2)
;;

let factorize e = match e with
  | EAdd ( (EMul (ea, eb)), (EMul (ea', ec))) ->
    if (eval ea) = (eval ea') then
      EMul (ea, EAdd (eb, ec))
    else
      e
  | _ -> e
;;


let expand e = match e with
  | EMul (ea, EAdd (eb, ec)) ->
    EAdd ( (EMul (ea, eb)), (EMul (ea, ec)))
  | _ -> e
;;

let simplify e = match e with
  | EMul (_, EInt 0) ->
    EInt 0
  | EMul (EInt 0, _) ->
    EInt 0
  | EMul (e, EInt 1) ->
    e
  | EMul (EInt 1, e) ->
    e
  | EAdd (e, EInt 0) ->
    e
  | EAdd (EInt 0, e) ->
    e
  | _ -> e
;;
