(define (domain hanoi-agents-3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg - place
    disk - place
    stage
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?d - disk ?x - place)
    (can-move ?a - agent ?d - disk)
    (at ?s - stage)
    (next ?s - stage ?t - stage)
  )
  (:action move
    :parameters (?a - agent ?d - disk ?from - place ?to - place ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
)