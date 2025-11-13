(define (domain two-agent-hanoi-20-ordered-4)
  (:requirements :strips :typing)
  (:types
    place
    agent
    step
    disk peg - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can-move ?a - agent ?d - disk)
    (allowed-move ?s - step ?a - agent ?d - disk ?from - place ?to - place)
    (next ?s - step ?t - step)
    (at-step ?s - step)
    (legal-target ?d - disk ?to - place)
  )
  (:action move
    :parameters (?ag - agent ?d - disk ?from - place ?to - place ?s - step ?t - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?t)
      (allowed-move ?s ?ag ?d ?from ?to)
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (legal-target ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-step ?s))
      (at-step ?t)
    )
  )
)