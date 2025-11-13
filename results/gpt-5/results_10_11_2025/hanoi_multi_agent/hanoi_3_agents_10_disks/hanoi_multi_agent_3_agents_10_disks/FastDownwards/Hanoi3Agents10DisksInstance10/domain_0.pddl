(define (domain hanoi-agents-3peg-10disk)
  (:requirements :strips :typing)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?s - place)
    (clear ?s - place)
    (smaller ?x - disk ?y - disk)
    (allowed ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?onto - disk)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (clear ?from)
      (not (clear ?onto))
    )
  )
)