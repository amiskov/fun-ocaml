(* A phone number is a sequence of four integers. *)
type phone_number = int * int * int * int;;

(* A contact has a name and a phone number. *)
type contact = {
  name         : string;
  phone_number : phone_number
};;

(* invariant *)
type database =
  | NoContact
  | DataNode of database * contact * database

let search db name =
  let rec traverse = function
    | NoContact -> Error
    | DataNode (left, contact, right) ->
      if contact.name = name then
        FundContact name
      else if name < contact.name then
        traverse left
      else
        traverse right
  in traverse db
;;

let yoda = {name = "Yoda"; phone_number = (1,1,1,1)};;
let luke = {name = "Luke"; phone_number = (2,2,2,2)};;
let leia = {name = "Leia"; phone_number = (3,3,3,3)};;

DataNode(DataNode(NoContact, leia, NoContact),
         luke,
         DataNode(NoContact, yoda, NoContact))