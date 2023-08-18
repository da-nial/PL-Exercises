(* Written by Danial Hamdi - 9731111 *)
datatype 'a tree = LEAF of 'a
                  | NODE of 'a tree * 'a tree;

fun maptree(f) =
    let
        fun g(LEAF(v)) = LEAF(f(v))
          | g(NODE(tree_1, tree_2)) = NODE(g(tree_1), g(tree_2))
    in
        g
    end;

val tree = (NODE(NODE(LEAF(1), LEAF(2)), LEAF(3)));
val f = fn(x) => x+1;
(maptree(f))(tree);
