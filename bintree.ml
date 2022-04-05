type bintree = Final_node of int | Node of int * bintree * bintree;;

type direct = Left | Right;;

(* type position = direct list;; *)

let rec join (a:bintree) (b:bintree) (pos: direct list): bintree =
  match a,pos with
  | Final_node _ ,[] -> b
  | Final_node _ , _ -> a
  | Node (i,l,r), Left::t -> Node (i,join l b t,r)
  | Node (i,l,r), Right::t -> Node (i,l,join r b t)
  | _ -> a;;

let rec mirror (a:bintree) = match a with
  | Node (i,a,b) -> Node (i,mirror b, mirror a)
  | _ -> a;;

let rec mirror_pos : direct list -> direct list =
  function
  | [] -> []
  | Left::t -> Right::(mirror_pos t)
  | Right::t -> Left::(mirror_pos t);;

let rec is_leaf_node a pos =
  match a,pos with
  | Final_node _, [] -> true
  | Final_node _, _ -> false
  | Node _, [] -> false
  | Node (_,l,r), next::rest ->
    match next with
    | Left -> is_leaf_node l rest
    | Right -> is_leaf_node r rest;;


#require "imandra-discover-bridge";;
Imandra_discover_bridge.Top.init ();;
let funlist = [{|mirror|}; {|join|}; {|mirror_pos|};];;
#program;;
(* Imandra_discover_bridge.User_level.discover {|test|} ~num_random_checks:100 ~max_formula_size:15 ~verbose:true ~condition:"is_leaf_node" db funlist;; *)
(* Imandra_discover_bridge.User_level.discover {|test|} ~kb_completion:false ~num_random_checks:100 ~verbose:true ~condition:"is_leaf_node" db funlist;; *)
Imandra_discover_bridge.User_level.discover {|test|} ~kb_completion:false ~num_random_checks:100 ~verbose:true db funlist;;
(* Imandra_discover_bridge.User_level.discover {|test|} ~kb_completion:true ~num_random_checks:100 ~verbose:true ~condition:"is_leaf_node" db funlist;; *)
