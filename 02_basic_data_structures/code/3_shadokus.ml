let pb exp = Printf.printf "%B\n" (exp);;

type date =
  { year : int; month : int; day : int;
    hour : int; minute : int }

let the_origin_of_time =
  { year = 1; month = 1; day = 1;
    hour = 0; minute = 0 }


let wellformed date =
  let { year; month; day; hour; minute } = date in
  year >= 1 &&
  month >= 1 && month <= 5 &&
  day >= 1 && day <= 4 &&
  hour >= 0 && hour <= 2 &&
  minute >= 0 && minute <= 1;;


let next date =
  let { year; month; day; hour; minute } = date in

  let minute' =
    if minute = 1 then 0 else minute + 1 in

  let hour' =
    if minute' = 0 then hour + 1 else hour in

  let day' =
    if hour' > 2 then day + 1 else day in

  let month' =
    if day' > 4 then month + 1 else month in

  let year' =
    if month' > 5 then year + 1 else year in

  { year = year'
  ; month = if month' > 5 then 1 else month'
  ; day = if day' > 4 then 1 else day'
  ; hour = if hour' > 2 then 0 else hour'
  ; minute = minute'
  };;

(* #trace next;; *)

let of_int minutes =
  { year = minutes / (2 * 3 * 4 * 5) + 1
  ; month = ((minutes / (2 * 3 * 4)) mod 5) + 1
  ; day = ((minutes / (2 * 3)) mod 4) + 1
  ; hour = (minutes / 2) mod 3
  ; minute = if minutes mod 2 = 0 then 0 else 1
  };;

(* #trace of_int;; *)
(* of_int 3;; *)
(* pb (of_int 3 = { year = 1 ; month = 1 ; day = 1 ; hour = 1 ; minute = 1 });; *)

