(define (domain revised_travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city time)
  (:predicates
    (at ?city - city ?time - time)
    (has_flight ?from - city ?to - city)
    (next ?t1 - time ?t2 - time)
    (conference ?city - city ?time - time)
  )
  
  (:action fly
    :parameters (?from - city ?to - city ?from_time - time ?to_time - time)
    :precondition (and
      (at ?from ?from_time)
      (has_flight ?from ?to)
      (next ?from_time ?to_time)
    )
    :effect (and
      (not (at ?from ?from_time))
      (at ?to ?to_time)
    )
  )

  (:action stay
    :parameters (?city - city ?start_time - time ?end_time - time)
    :precondition (and
      (at ?city ?start_time)
      (next ?start_time ?end_time)
    )
    :effect (and
      (not (at ?city ?start_time))
      (at ?city ?end_time)
    )
  )
)