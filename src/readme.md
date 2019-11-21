# FUN OCaml
- Курс [Introduction to Functional Programming in OCaml](https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session04/about)
- [Документация по OCaml](https://caml.inria.fr/pub/docs/manual-ocaml/index.html)

Установка языка и REPLа на macOS:

```bash
brew install ocaml
brew install opam # пакетный менеджер

opam install utop # няшная обёртка над REPL-ом
```

Обычный REPL (не `utop`) нужно [запускать](https://stackoverflow.com/questions/11757239/how-to-repeat-last-command-in-ocaml-interpreter-shell) через `rlwrap ocaml`, чтобы можно было выбирать предыдущие команды.

Загрузить файл в REPL:

```ocaml
#use "filename.ml";;
```

Дебажить функции удобно через [`#trace`](https://ocaml.org/learn/tutorials/debug.html#Tracingfunctionscallsinthetoplevel):

```ocaml
#trace fn_name;;
fn_name <params>;;
```

