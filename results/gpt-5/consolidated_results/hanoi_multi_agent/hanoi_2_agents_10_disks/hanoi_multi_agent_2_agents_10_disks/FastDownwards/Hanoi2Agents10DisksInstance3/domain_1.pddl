(define (domain hanoi2agents)
  (:requirements :strips :typing)
  (:types agent peg disk support)
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (permitted ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg)
    :precondition (and
      (permitted ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk)
    :precondition (and
      (permitted ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (clear ?d)
      (not (clear ?to))
      (not (on ?d ?from))
    )
  )
)