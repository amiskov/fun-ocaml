(* Given prelude *)

(* 3D point *)
type point  = { x : float; y : float; z : float }

(* Velocity vector in 3D space *)
type dpoint = { dx : float; dy : float; dz : float }

(* Moving objects in 3D space *)
type physical_object = { position : point; velocity : dpoint }


(* point -> dpoint -> point *)
let move p dp =
  let { x; y; z } = p in
  let { dx; dy; dz } = dp in
  { x = (x +. dx); y = (y +. dy); z = (z +. dz) };;

let next obj =
  let { position; velocity} = obj in
  { position = move position velocity; velocity = velocity };;


(* 
https://ru.onlinemschool.com/math/library/analytic_geometry/point_point_length/
https://reader.lecta.rosuchebnik.ru/demo/7999/data/chapter21.xhtml
*)
let distance p1 p2 =
  sqrt(
    (p2.x -. p1.x) ** 2.0 +.
    (p2.y -. p1.y) ** 2.0 +.
    (p2.z -. p1.z) ** 2.0
  );;

let will_collide_soon p1 p2 =
  let p1_next = (next p1) in
  let p2_next = (next p2) in
  let p1 = p1_next.position in
  let p2 = p2_next.position in
  distance p1 p2 <= 2.;; (* 2 times radius *)

(* #trace distance;;   *)
#trace will_collide_soon;;
will_collide_soon
  {position = {x = 1.0; y = 1.0; z = 1.0};
   velocity = {dx = 0.0; dy = 0.0; dz = 0.0}}
  {position = {x = 1.0; y = 1.0; z = 1.0};
   velocity = {dx = 0.0; dy = 0.0; dz = 0.0}};;
