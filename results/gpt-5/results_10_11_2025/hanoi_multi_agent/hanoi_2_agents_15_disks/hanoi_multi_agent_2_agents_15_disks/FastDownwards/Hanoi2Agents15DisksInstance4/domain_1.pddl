(define (domain hanoi2agents15)
  (:requirements :typing :adl :negative-preconditions)
  (:types
    agent
    support - object
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)          ; adjacency: disk on disk or peg
    (clear ?s - support)                  ; nothing on this disk or peg
    (top ?d - disk ?p - peg)              ; d is the top disk of peg p
    (smaller ?x - disk ?y - disk)         ; x is smaller than y
    (held-by ?a - agent ?d - disk)        ; agent permission to move disk
  )

  (:action move
    :parameters (?a - agent ?x - disk ?from - peg ?to - peg)
    :precondition (and
      (held-by ?a ?x)
      (top ?x ?from)
      (clear ?x)
      (or
        (clear ?to)
        (exists (?y - disk) (and (top ?y ?to) (smaller ?x ?y)))
      )
    )
    :effect (and
      (not (top ?x ?from))

      ; Source update: x was the only disk on ?from (directly on the peg)
      (when (on ?x ?from)
        (and
          (not (on ?x ?from))
          (clear ?from)
        )
      )

      ; Source update: x was on some disk y (y becomes new top of ?from)
      (when (exists (?y - disk) (on ?x ?y))
        (and
          (not (on ?x ?y))
          (clear ?y)
          (top ?y ?from)
        )
      )

      ; Destination empty: x becomes bottom and top of ?to
      (when (clear ?to)
        (and
          (on ?x ?to)
          (not (clear ?to))
          (top ?x ?to)
        )
      )

      ; Destination nonempty: place x on current top y of ?to
      (when (exists (?y - disk) (top ?y ?to))
        (and
          (not (top ?y ?to))
          (not (clear ?y))
          (on ?x ?y)
          (top ?x ?to)
        )
      )
    )
  )
)