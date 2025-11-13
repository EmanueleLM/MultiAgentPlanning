(define (domain hanoi-agents-single-move-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?x - disk ?y - place)
    (allowed ?a - agent ?d - disk)
    (current ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place ?s - stage ?t - stage)
    :precondition (and
      (allowed ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
      (current ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?to))
      (not (current ?s))
      (current ?t)
    )
  )
)