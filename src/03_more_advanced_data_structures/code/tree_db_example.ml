(* A phone number is a sequence of four integers. *)
type phone_number = int * int * int * int

(* A contact has a name and a phone number. *)
type contact = {
  name         : string;
  phone_number : phone_number
}

(* Invariant *)
type database =
  | NoContact
  | DataNode of database * contact * database

(* Create Some Records for DB *)
let yoda = {name = "Yoda"; phone_number = (1,1,1,1)}
let luke = {name = "Luke"; phone_number = (2,2,2,2)}
let leia = {name = "Leia"; phone_number = (3,3,3,3)}

(* Create DB *)
let db = DataNode(DataNode(NoContact, leia, NoContact),
                  luke,
                  DataNode(NoContact, yoda, NoContact))

let search db name =
  let rec traverse = function 
    | NoContact -> Error "Contact not found"
    | DataNode (left, contact, right) ->
      if contact.name = name then
        Ok contact
      else if name < contact.name then
        traverse left
      else
        traverse right
  in traverse db

let insert db contact =
  let rec traverse t =
    match t with
    | NoContact ->
      DataNode (NoContact, contact, NoContact)
    | DataNode (left, contact', right) ->
      if contact.name = contact'.name then t
      else if contact.name < contact'.name then
        DataNode (traverse left, contact', right)
      else
        DataNode (left, contact', traverse right)
  in
  traverse db

