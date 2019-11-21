# More Advanced Data Structures
Рассматриваются алгебраические типы данных, которые позволяют лучше структурировать значения:

- [Tagged Values](#tagged-values)
- [Recursive Types](#recursive-types)
- [Tree-like Values](#tree-like-values)
- [Case Study: a Story Teller](#case-study-story-teller)
- Polymorphic Algebraic DataTypes
- Advanced Topics

## Tagged Values
В примере с базой данных контактов функция `engine` возвращала кортеж с тремя значениями: статус, база и контакт.

Но эти три значения не всегда актуальны:

- если статус `false`, то два остальных параметра не имеют смысла;
- если обновили базу, то интересная только обновлённая база, не контакт;
- если нашли контакт, то база не имеет значения.

Мы можем ввести новый тип, который описывает эти ситуации:

```ocaml
type query_result =
  | Error
  | NewDatabase of database
  | FoundContact of contact * int
```

`query_result` is a Sum Type: a disjoint union of types (несвязное объединение) — несколько несвязанных типов объединяются в один общий тип.

Общий вид:

```ocaml
type some_type_identifier =
  | SomeTag of some_type * ... * some_type
  | ...
```

`SomeTag` — тэг — должен начинаться с большой буквы и быть уникальным.

### Constructing Tagged Values
Тэги — это конструкторы: `SomeTag (some_expression, ...)`. После названия `SomeTag` идёт паттерн, который мы можем использовать в паттерн-матчинге:

```ocaml
match some_expression with
  | some_pattern -> branch_expression
  ...
                            
let engine db query =
  match query with
  | Insert contact -> insert db contact
  | Delete contact -> delete db contact
  | Search name -> search db contact
```

Паттерн-матчинг часто используется в функциях в таком виде:

```ocaml
let f x = match x with
  | some_pattern -> some_expression
  ...
```

Для этого есть сокращённый синтаксис:

```ocaml
let f = function
  | some_pattern -> some_expression
  ...
```

## Recursive Types
Списки или деревья в CS имеют unbound depth.

Пример рекурсивного типа — список целых чисел:

```ocaml
type int_list =
  | EmptyList
  | SomeElement of int * int_list
```

В ЭВМ OCaml-списки представлены как связные списки.

Тип (sum type), который в своем определении ссылается на себя — рекурсивный.

В OCaml есть готовый тип для списка: `t list`, где `t` — тип элемента списка.

`[]` — паттерн для пустого списка.

`i :: r` — паттерн для головы и хвоста (скобки не нужны!).

`[some_expr; ... ; some_expr]` — объявление списка.

`@` — конкатенация списков: `[1;2;3] @ [4]`.

## Tree-like Values
Example of tree-like data structure:

```
      contact
      /     \
database   database
```

- db from the left is lexicographically less than `contact`
- db from the right is lexicographically more than `contact`

В задаче про базу данных контактов можно использовать рекурсивный тип `database`:

```ocaml
{{#include ./code/tree_db_example.ml:10:23}}
```

С помощью типа `database` мы получаем _инвариант_ — запрашивая базу мы получим тип `database` в любом случае.

Искать по такой базе — значит совершить обход дерева:

```ocaml
{{#include ./code/tree_db_example.ml:25:35}}
```

Это решение для `search` работает быстрее, чем решение с массивом. Потому что в худшем случае (когда контакт не будет найден) мы обойдём только одну ветку целиком. С массивом придётся обойти всю базу.

_TODO:_ сделать базу [сбалансированным деревом](https://www.youtube.com/watch?v=WXXetwePSRk), чтобы алгоритм поиска был ещё более оптимальным:

> As an exercise, try to maintain the extra invariant that the tree is balanced, i.e. that its height is bound by the logarithm of the number of contacts.

## Case-study: Story Teller