# The wolf, goat and cabbage problem

## The problem

A shepherd has to take a wolf, a goat, and some cabbage across a river. His boat has enough room for the shepherd plus either the wolf or the goat or the cabbage. If he takes the cabbage with him, the wolf will eat the goat. If he takes the wolf, the goat will eat the cabbage. Only when the shepherd is present are the goat and the cabbage safe from their enemies. All the same, the shepherd carries wolf, goat, and cabbage across the river. How?

## An OCaml solution

Just an OCaml based solution:

```[Goat; None; Wolf; Goat; Cabbage; None; Goat]```

That means: 

* shepherd carries goat from bank A (initial bank) to bank B (destination bank); 
* shepherd comes back to bank A carries nothing;
* shepherd carries wolf to bank B;
* shepherd carries goat to bank A;
* shepherd carries cabbage to bank B;
* shepherd comes back to bank A;
* shepherd carries goat to bank B.

## How to run

### Fast way

Copy content from [river](river.ml) and past into [OCamlPro](https://try.ocamlpro.com/)

### Other way

Install [OCaml](https://github.com/ocaml/ocaml)
