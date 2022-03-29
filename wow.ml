module Wow = struct

  let h = Hashtbl.create 100i

  let rec a n m =
    let return v =
      Hashtbl.add h (n,m) v;
      v
    in
    if Hashtbl.mem h (n,m) then (
      Hashtbl.find h (n,m)
    )
    else (
      if n = 0 then return m
      else return (a (n-1) m + Z.gcd (a (n-1) m) (m-n))
    )

  let top n = a (n-1) n;;

end [@@program];;
