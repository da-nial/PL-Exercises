(* Written by Danial *)
datatype edgeW = E of int;
datatype nodeW = N of int;
datatype wbtree = ROOT of nodeW * wbtree * wbtree
                  | NODE of edgeW * nodeW * wbtree * wbtree
                  | LEAF of edgeW * nodeW;

val tree = ROOT(
    N(3),
    (LEAF(E(3), N(2))),
    (LEAF(E(2), N(1)))
);

fun minPath(ROOT(N(n), tree_1, tree_2)) = (
   let
     val leftTreeMinPath = n + minPath(tree_1);
     val rightTreeMinPath = n + minPath(tree_2);
   in
     if leftTreeMinPath < rightTreeMinPath then leftTreeMinPath else rightTreeMinPath
   end
   )
 | minPath(NODE(E(e), N(n), tree_1, tree_2)) = (
     let
       val leftTreeMinPath = e + n + minPath(tree_1);
       val rightTreeMinPath = e + n + minPath(tree_2);
     in
       if leftTreeMinPath < rightTreeMinPath then leftTreeMinPath else rightTreeMinPath
     end
     )
 | minPath(LEAF(E(e), N(n))) = (
      e + n
      );
