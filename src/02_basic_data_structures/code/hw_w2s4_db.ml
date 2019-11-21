(* A phone number is a sequence of four integers. *)
type phone_number = int * int * int * int;;

(* A contact has a name and a phone number. *)
type contact = {
  name         : string;
  phone_number : phone_number
};;

(* Here is a dumb contact. *)
let nobody = { name = ""; phone_number = (0, 0, 0, 0) };;

(* A database is a collection of contacts. *)
type database = {
  number_of_contacts : int;
  contacts : contact array;
};;

(* [make n] is the database with no contact and at most [n] contacts
    stored inside. *)
let make max_number_of_contacts =
  {
    number_of_contacts = 0;
    contacts = Array.make max_number_of_contacts nobody
  };;

(* Queries are represented by a code and a contact.
   - If the code is 0 then the contact must be inserted.
   - If the code is 1 then the contact must be deleted.
   - If the code is 2 then we are looking for a contact
     with the same name in the database. *)
type query = {
  code    : int;
  contact : contact;
}

let search db contact =
  let rec aux idx =
    if idx >= db.number_of_contacts then
      (false, db, nobody)
    else if db.contacts.(idx).name = contact.name then
      (true, db, db.contacts.(idx))
    else
      aux (idx + 1)
  in
  aux 0;;

let insert db contact =
  if db.number_of_contacts >= Array.length db.contacts then
    (false, db, nobody)
  else
    let (status, db, _) = search db contact in
    if status then (false, db, contact) else
      let cells i =
        if i = db.number_of_contacts then contact else db.contacts.(i)
      in
      let db' = {
        number_of_contacts = db.number_of_contacts + 1;
        contacts = Array.init (Array.length db.contacts) cells
      }
      in
      (true, db', contact);;

let delete db contact =
  let (status, db, contact) = search db contact in
  if not status then (false, db, contact)
  else
    let sorter a b =
      (* Sort contacts array so nobodies will be after normal contacts *)
      if (a.name = "" && b.name = "") then 0
      else if a.name = "" then 1
      else -1 in
    let cells i =
      if db.contacts.(i).name = contact.name then
        nobody
      else
        db.contacts.(i) in
    let arr = (Array.init (Array.length db.contacts) cells) in
    let _ = (Array.sort sorter arr) in
    let db' = {
      number_of_contacts = db.number_of_contacts - 1;
      contacts = arr
    }
    in
    (true, db', contact);;

(* Engine parses and interprets the query. *)
let engine db { code ; contact } =
  if code = 0 then insert db contact
  else if code = 1 then delete db contact
  else if code = 2 then search db contact
  else (false, db, nobody);;

let sveta = {name = "Sveta"; phone_number = (1,2,3,4) }
let vasya = {name = "Vasya"; phone_number = (2,3,4,5) };;

(* let kolya = {name = "Kolya"; phone_number = (3,4,5,6) }
   let stepa = {name = "Stepa"; phone_number = (4,5,6,7) }
   let vanya = {name = "Vanya"; phone_number = (5,6,7,8) }
*)

(* Initialize DB with 5 fields *)
let db = make 3;;

print_string "Insert Sveta\n";;
let q1 = engine db { code = 0; contact = sveta };;

print_string "Insert Vasya\n";;
let q2 = let (_, db, _) = q1 in engine db { code = 0; contact = vasya };;

print_string "Remove Sveta\n";;
let q3 = let (_, db, _) = q2 in engine db { code = 1; contact = sveta };;

print_string "Find Vasya\n";;
let q4 = let (_, db, _) = q3 in engine db { code = 2; contact = vasya }

(* Homework *)
(* let proof_of_bug =
   let sveta = {name = "Sveta"; phone_number = (1,2,3,4) } in
   let vasya = {name = "Vasya"; phone_number = (2,3,4,5) } in
   [|{ code = 0; contact = sveta }; 
    { code = 0; contact = vasya }; 
    { code = 1; contact = sveta };
    { code = 2; contact = vasya}|]
*)


(*  let delete db contact =
    "Replace this string with your implementation." ;;

    let update db contact =
    "Replace this string with your implementation." ;;

    let engine db { code ; contact } =
    "Replace this string with your implementation." ;; *)
