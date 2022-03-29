
Imandra.add_plugin_rand ();;

type t = | A of int | B of t' and
 t' = | C of t | D of t'' and
 t'' = | E of t | F of t';;

(* let value = C A;; *)
