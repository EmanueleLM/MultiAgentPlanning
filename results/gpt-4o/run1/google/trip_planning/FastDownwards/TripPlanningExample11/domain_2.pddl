(define (domain travel_plan)
  (:requirements :strips :typing :negative-preconditions)
  (:types city time)
  (:predicates
    (at ?city - city ?time - time)
    (has_flight ?from - city ?to - city)
    (attend_conference ?time - time)
    (visited_vienna)
    (visited_vilnius)
    (visited_valencia)
    (next ?t1 - time ?t2 - time)
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
      (when (and (not (visited_vienna)) (at vienna ?end_time)) (visited_vienna))
      (when (and (not (visited_vilnius)) (at vilnius ?end_time)) (visited_vilnius))
      (when (and (not (visited_valencia)) (at valencia ?end_time)) (visited_valencia))
    )
  )
)