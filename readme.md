# FUN OCaml
[Свежая документация](https://caml.inria.fr/pub/docs/manual-ocaml/index.html)

```bash
brew install ocaml
brew install opam

# Better REPL
opam install utop
```

## REPL
В обычном REPL, не в `utop`, чтобы можно было выбирать предыдущие команды, нужно [запускать](https://stackoverflow.com/questions/11757239/how-to-repeat-last-command-in-ocaml-interpreter-shell) REPL через `rlwrap ocaml`.

Загрузить файл в REPL:

```ocaml
#use "filename.ml";;
```

Дебажить функцию удобно через `#trace`:

```ocaml
#trace fn_name;;
fn_name <params>;;
```

