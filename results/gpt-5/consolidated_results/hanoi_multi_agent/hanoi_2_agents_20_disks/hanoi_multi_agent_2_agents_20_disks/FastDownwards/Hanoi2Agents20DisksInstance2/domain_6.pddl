(define (domain hanoi-2agent-20-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
    agent step
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller-than ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller-than ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)