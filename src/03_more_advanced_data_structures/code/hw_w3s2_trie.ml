open Str

type trie = Trie of int option * char_to_children
and char_to_children = (char * trie) list

let empty =
  Trie (None, [])

let example =
  Trie (None,
        [('i', Trie (Some 11, [('n', Trie (Some 5, [('n', Trie (Some 9, []))]))]));
         ('t',
          Trie (None,
                [('e',
                  Trie (None,
                        [('n', Trie (Some 12, [])); ('d', Trie (Some 4, []));
                         ('a', Trie (Some 3, []))]));
                 ('o', Trie (Some 7, []))]));
         ('A', Trie (Some 15, []))])

let rec children_from_char (m : char_to_children) (c : char) : trie option =
  match m with
  | [] -> None
  | (ch, t) :: rest ->
    if ch = c then
      Some t
    else
      children_from_char rest c
;;

let update_children m c t =
  let rec aux lst acc =
    match lst with
    | []  -> acc
    | (ch, t_old) :: rest ->
      if ch = c then
        aux rest (List.append acc [(ch, t)])
      else
        aux rest (List.append acc [(ch, t_old)])
  in
  match (children_from_char m c) with
  | Some t ->
    aux m []
  | None ->
    List.append m [(c, t)]
;;

let lookup trie w =
  let aux i t =
    match t with
    | Trie (None, []) ->
      None
    | Trie (o, children) ->

;;

lookup example "inn";;


(*
let insert trie w v =
  "Replace this string with your implementation." ;;
*)