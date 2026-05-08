(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types support disk peg stage)
  
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?x - support)
    (allowed ?d - disk ?s - support)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move
    :parameters (?d - disk ?from - support ?to - support ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (clear ?to))
      (clear ?from)
      (clear ?d)

      (not (current ?s))
      (current ?s2)
    )
  )
)