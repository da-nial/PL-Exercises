(* Dan Grossman, Coursera PL, HW2 Provided Code *)
(* Danial Hamdi Solutions *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun remove_elem(target: string, container: string list) =
    (case container
         [] => NONE
       | head::tail => body2)

fun all_except_option(target: string, container: string list) =
    let
    fun aux(target: string, container: string list) =
        (case container of
            [] => NONE
          | head::tail => if same_string(head, target)
                          then tail
                          else head::aux(target, tail)
         )
      val res = aux(target, container);
    in
    (case container of
         [] => NONE
       | x::[] => if same_string(x, target) then SOME([]) else SOME[x]
       | _ => (case res of
                    [] => NONE
                  | xs => SOME(res)
            )
        )
    end

val test2 = get_substitutions1 ([["foo"],["there"]], "foo");

fun get_substitutions1(substitutions: string list list, s: string) =
    (case substitutions of
         [] => []
       | head::tail =>
            let
                val head_cleaned = all_except_option(s, head)
            in
                (case head_cleaned of
                     NONE => get_substitutions1(tail, s)
                   | SOME(xs) => xs@get_substitutions1(tail, s)
                )
            end
   )

val target = "a";
val container = ["b", "d", "a", "c", "g"];
val s = all_except_option(target, container);

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
(* datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove *)

(* put your solutions for problem 2 here *)
