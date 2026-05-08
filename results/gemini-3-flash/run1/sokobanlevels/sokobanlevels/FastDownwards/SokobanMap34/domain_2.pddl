(define (domain sokoban)
  (:requirements :typing :negative-preconditions)
  (:types loc direction)
  (:predicates
    (at-player ?l - loc)
    (at-box ?l - loc)
    (adj ?l1 ?l2 - loc ?d - direction)
  )
  (:action move
    :parameters (?from - loc ?to - loc ?d - direction)
    :precondition (and (at-player ?from) (adj ?from ?to ?d) (not (at-box ?to)))
    :effect (and (not (at-player ?from)) (at-player ?to))
  )
  (:action push
    :parameters (?p-from - loc ?b-from - loc ?b-to - loc ?d - direction)
    :precondition (and (at-player ?p-from) (adj ?p-from ?b-from ?d) (at-box ?b-from) (adj ?b-from ?b-to ?d) (not (at-box ?b-to)))
    :effect (and (not (at-player ?p-from)) (at-player ?b-from) (not (at-box ?b-from)) (at-box ?b-to))
  )
)