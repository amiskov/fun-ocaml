(* Define type alias with named fields *)
type point2D = { x : int; y : int };;

(* compiler will infer this type: point2D *)
let origin = { x = 0; y = 0 };;
(* print_int origin.x;; *)

let from_tuple (x, y) = { x = x; y = y };;

(* the same, but shorter: *)
let from_tuple (x, y) = { x; y };;

let a : point2D = from_tuple (4, 2);;
let b : point2D = from_tuple (10, 5);;

print_int a.x;;
print_string "\n";;
print_int a.y;;
print_string "\n";;

type box = {
  left_upper_corner : point2D;
  right_upper_corner : point2D;
};;

let the_box =
  { left_upper_corner = a; right_upper_corner = b };;

print_string "\n";;
print_int the_box.left_upper_corner.x;;
print_string ";";;
print_int the_box.left_upper_corner.y;;
print_string "\n";;

(* Function takes a box type and destructure it and then destructure it's point *)
let get_min_x { left_upper_corner = {x}} = x;;
print_int (get_min_x the_box);;
