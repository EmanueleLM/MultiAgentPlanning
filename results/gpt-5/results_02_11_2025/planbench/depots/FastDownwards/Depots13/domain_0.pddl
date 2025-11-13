(define (domain scenario2)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (at ?x)
    (connected ?a ?b)
    (visited ?x)
  )
  (:action move
    :parameters (?from ?to)
    :precondition (and (at ?from) (connected ?from ?to) (not (visited ?to)))
    :effect (and (not (at ?from)) (at ?to) (visited ?to))
  )
)