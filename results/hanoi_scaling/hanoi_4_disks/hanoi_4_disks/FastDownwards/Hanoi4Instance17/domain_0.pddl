(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?s - (either disk peg))
    (clear ?o - (either disk peg))
    (smaller ?a - disk ?b - disk)
  )

  (:action move-to-empty
    :parameters (?x - disk ?from - (either disk peg) ?to - (either disk peg))
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-onto-disk
    :parameters (?x - disk ?from - (either disk peg) ?y - disk ?to - (either disk peg))
    :precondition (and
      (on ?x ?from)
      (clear ?x)
      (on ?y ?to)
      (clear ?y)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?y)
      (clear ?from)
      (not (clear ?y))
    )
  )
)