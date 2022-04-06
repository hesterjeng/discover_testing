
Imandra.add_plugin_rand ();;

(* type t = | A of int | B of t' and *)
type mr1 = | A of int | B of mr2 and
 mr2 = | C of int*mr1 | D of mr3*mr3 and
 mr3 = | E of mr1 | F of mr2;;

type trec =
  {
    al1 : mr1;
    al2 : mr2;
    al3 : mr3;
  };;

type ttruple = mr1*mr2*mr3;;

type talist = ttruple list;;

type trub = int*int;;
type trub2 = A of trub;;

type kind = Granny_smith | Red_delicious | Fuji;;

type apple = { kind: kind;}

type apple0 = {is_ripe:bool;}

type apple2 = { kind: kind;
               is_ripe: bool }

type apple3 = { kind: kind;
               mass: Q.t;
               days_old: Z.t;}

type apple4 = { kind: kind;
               mass: Q.t;
               days_old: Z.t;
               is_ripe: bool }
