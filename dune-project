(lang dune 3.17)

(name ppx_untype)

(generate_opam_files true)

(source
 (github panglesd/ppx_untype))

(authors "Paul-Elliot <peada@free.fr>")

(maintainers "Paul-Elliot <peada@free.fr>")

(license MIT)

(package
 (name ppx_untype)
 (synopsis "A PPX to remove all type errors from the OCaml compiler")
 (description "A PPX to remove all type errors from the OCaml compiler")
 (depends ocaml ppxlib)
 (tags
  (ppxlib untype)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
