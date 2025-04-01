open Ppxlib

let impl structure =
  let loc = Location.none in
  let at txt = { Location.txt; loc } in
  let add_obj_magic =
    object
      inherit Ast_traverse.map as super

      method! expression exp =
        let exp = super#expression exp in
        let magic =
          Ast_builder.Default.pexp_ident ~loc
            (at (Longident.parse "Stdlib.Obj.magic"))
        in
        Ast_builder.Default.eapply magic [ exp ] ~loc
    end
  in
  let remove_all_warnings =
    let payload =
      let open Ast_builder.Default in
      let v = estring ~loc "-A" in
      let payload = pstr_eval ~loc v [] in
      Ast.PStr [ payload ]
    in
    let attr =
      Ast_builder.Default.attribute ~loc ~name:(at "warning") ~payload
    in
    Ast_builder.Default.pstr_attribute ~loc attr
  in
  remove_all_warnings :: add_obj_magic#structure structure

let () = Driver.register_transformation ~impl "absent_minded_transformation"
