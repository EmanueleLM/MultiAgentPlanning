(define (domain craving-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (craves ?from - obj ?to - obj)
  )
  (:action form-crave
    :parameters (?from - obj ?to - obj)
    :precondition (not (craves ?from ?to))
    :effect (and (craves ?from ?to))
  )
)