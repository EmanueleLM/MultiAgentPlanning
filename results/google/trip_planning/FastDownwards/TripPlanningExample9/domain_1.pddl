(define (domain TripPlanningExample9)
  (:requirements :strips)
  (:predicates
    (at ?city ?day)
    (next ?day1 ?day2)
    (flight ?from ?to)
  )

  (:action stay
    :parameters (?city ?d1 ?d2)
    :precondition (and (at ?city ?d1) (next ?d1 ?d2))
    :effect (and (at ?city ?d2))
  )

  (:action travel
    :parameters (?from ?to ?d1 ?d2)
    :precondition (and (at ?from ?d1) (flight ?from ?to) (next ?d1 ?d2))
    :effect (and (at ?to ?d2))
  )
)