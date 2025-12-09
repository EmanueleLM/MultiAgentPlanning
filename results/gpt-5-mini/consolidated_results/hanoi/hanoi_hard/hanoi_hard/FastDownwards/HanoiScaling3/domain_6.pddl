(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (hanoi-player ?a - agent)
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (smaller ?d - disk ?p - place)
  )

  (:action move
    :parameters (?a - agent
                 ?d - disk
                 ?from - place
                 ?to - place
                 ?s - step
                 ?s2 - step)
    :precondition (and
      (hanoi-player ?a)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-step ?s)
      (step-successor ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current-step ?s))
      (current-step ?s2)
    )
  )
)