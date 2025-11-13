(define (domain hanoi2agents15_strips)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support - object
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (top ?d - disk ?p - peg)
    (smaller ?x - disk ?y - disk)
    (held-by ?a - agent ?d - disk)
    (neqp ?p1 - peg ?p2 - peg)
  )

  (:action move-dd
    :parameters (?a - agent ?x - disk ?y - disk ?z - disk ?from - peg ?to - peg)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?y)
      (clear ?x)
      (top ?x ?from)
      (top ?z ?to)
      (clear ?z)
      (smaller ?x ?z)
      (neqp ?from ?to)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (top ?x ?from))
      (top ?y ?from)
      (on ?x ?z)
      (not (clear ?z))
      (not (top ?z ?to))
      (top ?x ?to)
    )
  )

  (:action move-dp
    :parameters (?a - agent ?x - disk ?y - disk ?from - peg ?to - peg)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?y)
      (clear ?x)
      (top ?x ?from)
      (clear ?to)
      (neqp ?from ?to)
    )
    :effect (and
      (not (on ?x ?y))
      (clear ?y)
      (not (top ?x ?from))
      (top ?y ?from)
      (on ?x ?to)
      (not (clear ?to))
      (top ?x ?to)
    )
  )

  (:action move-pd
    :parameters (?a - agent ?x - disk ?z - disk ?from - peg ?to - peg)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (top ?x ?from)
      (top ?z ?to)
      (clear ?z)
      (smaller ?x ?z)
      (neqp ?from ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (not (top ?x ?from))
      (on ?x ?z)
      (not (clear ?z))
      (not (top ?z ?to))
      (top ?x ?to)
    )
  )

  (:action move-pp
    :parameters (?a - agent ?x - disk ?from - peg ?to - peg)
    :precondition (and
      (held-by ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (top ?x ?from)
      (clear ?to)
      (neqp ?from ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (not (top ?x ?from))
      (on ?x ?to)
      (not (clear ?to))
      (top ?x ?to)
    )
  )
)