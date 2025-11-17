(define (domain hanoi-2agent-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg - support
    disk - support
  )
  (:predicates
    (at ?d - disk ?p - peg)
    (on ?d - disk ?s - support)
    (clear ?x - support)
    (smaller ?d1 - disk ?d2 - disk)
    (top ?d - disk)
    (allowed ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (at ?d ?from)
      (clear ?d)
      (top ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk ?p - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (at ?d ?from)
      (clear ?d)
      (top ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?to ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (top ?to))
      (not (at ?d ?from))
      (at ?d ?p)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?p - peg ?to - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (at ?d ?p)
      (clear ?d)
      (top ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (top ?from)
      (not (clear ?to))
      (not (at ?d ?p))
      (at ?d ?to)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk ?pfrom - peg ?pto - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (at ?d ?pfrom)
      (clear ?d)
      (top ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?to ?pto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (top ?from)
      (not (clear ?to))
      (not (top ?to))
      (not (at ?d ?pfrom))
      (at ?d ?pto)
    )
  )
)