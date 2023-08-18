
val curry = fn(f) => (fn(x) => fn(y) => f(x, y));
val uncurry = fn(f) => (fn(x, y) => (f(x))(y));


datatype IntString = TagInt of int
                   | TagStr of string;

fun demo(b) =
    let
        val x = if b then TagInt(3) else TagStr("Hi")
    in
        let
            val TagInt(m) = x;
        in
            m + 5
        end
    end;
