# Ppx_untype

> [!WARNING]
>
> This PPX was made as an April's fool joke. Do not use in production, do use it for fun!

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

---

Technical information: it works by wrapping every expression in a call to `Obj.magic`: `1 + 1.` is turned into:

```
Obj.magic(
  (Obj.magic (+))
    (Obj.magic 1)
    (Obj.magic 1.))
```
