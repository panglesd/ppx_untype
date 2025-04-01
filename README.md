# Ppx_untype

A simple PPX to remove all the annoying type errors produced by the OCaml compiler.

Before:

```
$ dune exec test/main.exe
File "test/main.ml", line 1, characters 26-28:
1 | let () = print_float (1 + 2.)
                              ^^
Error: The constant 2. has type float but an expression was expected of type
         int
```

After:

```
$ dune exec test/main.exe
3.47667790392e-310
```

Much better!
